function x = quadraticSymbolic(coef)
    %Checking to see if there is the correct number of inputs
    if (length(coef) ~= 3)
       
        x = 'Null';
        return
       
    else
        
        %Generate the y values from cardanos formula in symbolic form
         x = quadratic(coef(1),coef(2),coef(3));
         
         x = double(x);
         
    end
    
end

%Gets the coefficients of a depressed cubic shifted by x = y-(b/3a)
function x = quadratic(aVal,bVal,cVal)
    syms x1(a, b, c)
    x1(a,b,c) = (-b + sqrt(b^2 - 4*a*c))/(2*a);
    x1Val = x1(aVal,bVal,cVal);
    
    
    syms x2(a, b, c)
    x2(a,b,c) = (-b - sqrt(b^2 - 4*a*c))/(2*a);
    x2Val = x2(aVal,bVal,cVal);
    
    x = [x1Val; x2Val];
end

