function cubicSpeedTest
    %get a more percise double value
    format long;
    
    %User click file input
    [filename, filepath] = uigetfile('*');
    
    if isnumeric(filename) || isnumeric(filepath)
        return
    end
    
    %Reading in the Excel file that contains the coefficients
    try
        coef = readcell([filepath filename],'Sheet','coef');        
    catch
       warndlg('Error Reading in the coefficients file'); 
       return
    end
    
    %Removing the headers from the cell
    coef = coef(2:end,:);
    
    %getting the size of the cell
    sz = size(coef);
    if(sz(2) ~= 4)
       warndlg('The input file does not contain 4 columns of coefficients.');
       return
    end
    
    %Setting the wait bar
    wb = waitbar(0);
    
    %Initializing the CellArray to the number of rows read in from the file
    cellArray{sz(1),14} = {};
    
    %Looping through each set of coef, timing the functions creating a cell
    %array to hold some information
    for i = 1:sz(1)
        
        if isvalid(wb)
            %Starting a waitbar to show the progress of the program
            waitbar(i/sz(1),wb,[ num2str(i), ' of ', num2str(sz(1))]);
        else
            wb = waitbar(i/sz(1),[ num2str(i), ' of ', num2str(sz(1))]);
        end
        
        %Starts the timer for symbolic
        cdsTic = tic;
        
        %Calculates the roots for Symbolic
        cdsroot = cardanosSymbolic([coef{i,1}, coef{i,2}*i,coef{i,3}, coef{i,4}]);
        
        %Stops the timer for symbolic
        cdsTime = toc(cdsTic);
        
        %Parses the results to real and imaginary part
        cdsrootReal = sort(real(cdsroot));
        cdsrootImga = sort(imag(cdsroot));
        
        %Starts the timer for cardanos
        cdTic = tic;
        
        %Finds the roots for cardanos
        cdroot = cardanos([coef{i,1}, coef{i,2},coef{i,3}, coef{i,4}]);
        
        %Stops the timer for cardanos
        cdTime = toc(cdTic); 
        
        %Parses the results to real and imaginary parts
        cdrootReal = sort(real(cdroot));
        cdrootImga = sort(imag(cdroot));
        
        %Starts the time for companion matrix
        rtTic = tic;
        
        %Find the roots with companion matrix
        rtroot = roots([coef{i,1}, coef{i,2},coef{i,3}, coef{i,4}]);
        
        %Stops the timer for the companion matrix
        rtTime = toc(rtTic);
        
        %Parsees the results to real and imaginary parts
        rtrootReal = sort(real(rtroot));
        rtrootImga = sort(imag(rtroot));
        
        %Finds the mse for the real and imaginary part of cardanos compared
        %to the companion matrix
        mseRealCardanos = sqrt(sum((cdrootReal-rtrootReal).^2));
        mseImagCardanos = sqrt(sum((cdrootImga-rtrootImga).^2));
        
        %Find the mse for the real and imaginary parts of cardanos symbolic
        %compared to the companion matrix
        mseRealCardanosSymbolic = sqrt(sum((cdsrootReal-rtrootReal).^2));
        mseImagCardanosSymbolic = sqrt(sum((cdsrootImga-rtrootImga).^2));
        
        %Entering the coefficients into the cellArray
        cellArray{i,1} = coef{i,1};
        cellArray{i,2} = coef{i,2};
        cellArray{i,3} = coef{i,3};
        cellArray{i,4} = coef{i,4};
        
        %Entering the times into the cellArray
        cellArray{i,6} = rtTime;
        cellArray{i,7} = cdTime;
        cellArray{i,8} = cdsTime;
        
        %Entering in the mse for cardanos
        cellArray{i,10} = mseRealCardanos;
        cellArray{i,11} = mseImagCardanos;
        
        %Entering in the mse for cardanos symbolic
        cellArray{i,13} = mseRealCardanosSymbolic;
        cellArray{i,14} = mseImagCardanosSymbolic;
       
    end
    
    %Writing the cell array into the excel document where the data was
    %taken from
    writecell(cellArray,'cubicTimeTestXL.xlsx','Sheet','times','Range','A2');
    
    %Assigning the data into the base workspace to work with it to make
    %graphs
    assignin('base','cellArray', cellArray);
    
    %Creating the variable into vectors for graphing
    data = cell2mat(cellArray);
    rtdata = data(:,5);
    cddata = data(:,6);
    cdsdata = data(:,7);
    
    %Making the histogram
    subplotfig = figure('Name','Time Distribution of Root Finding Functions Cubic',...
                                'Tag','histFig',...
                                'NumberTitle','off',...
                                'Units','normalized',...
                                'Position',[1/6 1/4 2/3 1/2],...
                                'MenuBar','none');
                            
    ax1 = subplot(1,3,1);
    histogram(rtdata, 'FaceColor','#4DBEEE');
    ax1.Title.String = 'MATLAB''s Root Function';
    ax1.XLabel.String = 'Time (s)';
    ax1.YLabel.String = 'Number of Occurrences';
    
    ax2 = subplot(1,3,2);    
    histogram(cddata, 'FaceColor','#77AC30');
    ax2.Title.String = 'Cardano''s Formula Function';
    ax2.XLabel.String = 'Time (s)';
    
    ax3 = subplot(1,3,3);
    histogram(cdsdata, 'FaceColor','#7E2F8E');
    ax3.Title.String = 'Cardano''s Formula w/ Symbolic Answers';
    ax3.XLabel.String = 'Time (s)';
    
    %Deleting the wait bar
    delete(wb)
end