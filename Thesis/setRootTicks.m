function setRootTicks(handles, coef)
    
    if isempty(coef)
        return
    end 
        
    % Seperate the coefficients to get the numbers
    coef = strsplit(coef{1},{',','\t',' '});
    if isempty(coef{end})
     coef = coef(1:end-1);
    end
    
    if strcmp(handles.ButtonGroup.Mode.SelectedObject.String,'True Value')
        switch handles.ButtonGroup.Degree.SelectedObject.String
            case 'Quadratic'
                selectedSize = 3;
            case 'Cubic'
                selectedSize = 4;
            case 'Quartic'
                selectedSize = 5;
        end
        
        if length(coef) ~= selectedSize
            warndlg(['The number of coefficients is incorrect for a ', handles.ButtonGroup.Degree.SelectedObject.String,' function.'])
            return
        end
    
    end   
    
    coef = str2double(coef);
    
    if any(isnan(coef)) 
        return
    end
    
    polyroots = roots(coef);
    
    for i = 1:length(polyroots)
        if imag(polyroots(i)) == 0
            hold on;
            scatter(polyroots(i), polyval(coef, polyroots(i)),...
                'filled','s',...
                'MarkerEdgeColor','b',...
                'MarkerFaceColor','b');
        else
            disp(['Root #', num2str(i), ' is imaginary']);
        end
    end
    
    
end