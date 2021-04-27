function x = cardanos(coef)
    %Checking to see if there is the correct number of inputs
    if (length(coef) ~= 4)
        
        %Checking to see if the input is missing the x^2 term
        if (length(coef) == 3)
            
            opts.Interpreter = 'tex';
            opts.Default = 'Yes';
            cubic = [num2str(coef(1)) ,'x^3 + ', num2str(coef(2)),'x + ',num2str(coef(3))];
            
            isDepressed = questdlg(['Is this the cubic? ', cubic],...
                                    'Depressed Cubic','Yes','No',opts);
                                
            %If it is depressed 'missing x^2' term, continue with p and q 
            %as the inputs from the fucntion
            if(strcmp(isDepressed,'Yes'))
                
                %Generate the y values from cardanos formula in symbolic form
                x = cardanosFomula(coef(2)/coef(1),coef(3)/coef(1));
            else
                x = 'Null';
                return
            end
            
        else
            x = 'Null';
            return
        end
    else
        %Generate the coefficeients in symbolic form for p and q
        [p,q] = depressCubic(coef(1),coef(2),coef(3),coef(4));
        
        %Generate the y values from cardanos formula in symbolic form
         y = cardanosFomula(p,q);
         
        %generating the x values for the roots after adjusting from the
        %depressed roots
        x = y-(coef(2)/(3*coef(1)));
    end
    
end

%Gets the coefficients of a depressed cubic shifted by x = y-(b/3a)
function [p,q] = depressCubic(a,b,c,d)
    p = (3*a*c - b^2)/(3*a^2);
    q = (2*b^3-9*a*b*c+27*a^2*d)/(27*a^3);
end

%Gets the y values of the roots of the depressed cubic
function y= cardanosFomula(p,q)
    delta = (((q^2)/4)+((p^3)/27));
    
    %weird fix because matlabs cube root function doesnt work great
    %notice that it has to do with the discriminant...
    if  delta >= 0
        y1= nthroot((-q/2)+sqrt(((q^2)/4)+((p^3)/27)),3)+nthroot((-q/2)-sqrt(((q^2)/4)+((p^3)/27)),3);

        y2 = ((-1 + sqrt(-3))/2)*nthroot((-q/2)+sqrt(((q^2)/4)+((p^3)/27)),3)...
                    + ((-1 - sqrt(-3))/2)*nthroot((-q/2)-sqrt(((q^2)/4)+((p^3)/27)),3);

        y3= ((-1 - sqrt(-3))/2)*nthroot((-q/2)+sqrt(((q^2)/4)+((p^3)/27)),3)...
                    + ((-1 + sqrt(-3))/2)*nthroot((-q/2)-sqrt(((q^2)/4)+((p^3)/27)),3);
    else
    
        y1= ((-q/2)+sqrt(((q^2)/4)+((p^3)/27)))^(1/3)+((-q/2)-sqrt(((q^2)/4)+((p^3)/27)))^(1/3);

        y2 = ((-1 + sqrt(-3))/2)*((-q/2)+sqrt(((q^2)/4)+((p^3)/27)))^(1/3)...
                    + ((-1 - sqrt(-3))/2)*((-q/2)-sqrt(((q^2)/4)+((p^3)/27)))^(1/3);

        y3= ((-1 - sqrt(-3))/2)*((-q/2)+sqrt(((q^2)/4)+((p^3)/27)))^(1/3)...
                    + ((-1 + sqrt(-3))/2)*((-q/2)-sqrt(((q^2)/4)+((p^3)/27)))^(1/3);
    end

    y = [y1;y2;y3];
    
end