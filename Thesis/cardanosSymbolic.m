function x = cardanosSymbolic(coef)
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
  
    x = vpa(x);
end

%Gets the coefficients of a depressed cubic shifted by x = y-(b/3a)
function [pVal,qVal] = depressCubic(aVal,bVal,cVal,dVal)
    syms p(a,b,c)
    p(a,b,c) = (3*a*c - b^2)/(3*a^2);
    pVal = p(aVal,bVal,cVal);
    
    syms q(a,b,c,d)
    q(a,b,c,d) = (2*b^3-9*a*b*c+27*a^2*d)/(27*a^3);
    qVal = q(aVal,bVal,cVal,dVal);
end

%Gets the y values of the roots of the depressed cubic
function yVal = cardanosFomula(pVal,qVal)
    delta = (((qVal^2)/4)+((pVal^3)/27));
    
    %weird fix because matlabs cube root function doesnt work great
    if  delta >= 0
        syms y1(p,q)
        y1(p,q) = nthroot((-q/2)+sqrt(((q^2)/4)+((p^3)/27)),3)+nthroot((-q/2)-sqrt(((q^2)/4)+((p^3)/27)),3);
        y1Val = y1(pVal,qVal);

        syms y2(p,q)
        y2(p,q) = ((-1 + sqrt(-3))/2)*nthroot((-q/2)+sqrt(((q^2)/4)+((p^3)/27)),3)...
                    + ((-1 - sqrt(-3))/2)*nthroot((-q/2)-sqrt(((q^2)/4)+((p^3)/27)),3);
        y2Val = y2(pVal,qVal);

        syms y3(p,q)
        y3(p,q) = ((-1 - sqrt(-3))/2)*nthroot((-q/2)+sqrt(((q^2)/4)+((p^3)/27)),3)...
                    + ((-1 + sqrt(-3))/2)*nthroot((-q/2)-sqrt(((q^2)/4)+((p^3)/27)),3);
        y3Val = y3(pVal,qVal);
    else
        syms y1(p,q)
        y1(p,q) = ((-q/2)+sqrt(((q^2)/4)+((p^3)/27)))^(1/3)+((-q/2)-sqrt(((q^2)/4)+((p^3)/27)))^(1/3);
        y1Val = y1(pVal,qVal);

        syms y2(p,q)
        y2(p,q) = ((-1 + sqrt(-3))/2)*((-q/2)+sqrt(((q^2)/4)+((p^3)/27)))^(1/3)...
                    + ((-1 - sqrt(-3))/2)*((-q/2)-sqrt(((q^2)/4)+((p^3)/27)))^(1/3);
        y2Val = y2(pVal,qVal);

        syms y3(p,q)
        y3(p,q) = ((-1 - sqrt(-3))/2)*((-q/2)+sqrt(((q^2)/4)+((p^3)/27)))^(1/3)...
                    + ((-1 + sqrt(-3))/2)*((-q/2)-sqrt(((q^2)/4)+((p^3)/27)))^(1/3);
        y3Val = y3(pVal,qVal);
        
    end
    
    yVal = [y1Val;y2Val;y3Val];
    
end