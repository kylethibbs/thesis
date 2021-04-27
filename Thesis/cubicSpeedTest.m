function cubicSpeedTest
    
    %Reading in the Excel file that contains the coefficients
    try
        coef = readcell('cubicTimeTestXL.xlsx','Sheet','coef');        
    catch
       warndlg('Error Reading in the coefficients file'); 
       return
    end
    
    %Removing the headers from the cell
    coef = coef(2:end,:);
    
    %getting the size of the cell
    sz = size(coef);
    
    %Setting the wait bar
    wb = waitbar(0);
    
    %Looping through each set of coef, timing the functions
    for i = 1:sz(1)
        waitbar(i/sz(1),wb,[ num2str(i), ' of ', num2str(sz(1))]);
        
        cdsroots = cardanosSymbolic([coef{i,1}, coef{i,2},coef{i,3}, coef{i,4}]);
        
        
        cdroot = cardanos([coef{i,1}, coef{i,2},coef{i,3}, coef{i,4}]);
                
        
        rtroots = roots([coef{i,1}, coef{i,2},coef{i,3}, coef{i,4}]);
        
        
    end
    delete(wb)
end