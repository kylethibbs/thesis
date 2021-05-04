function x = quadratic(coef)
    %Checking to see if there is the correct number of inputs
    if (length(coef) ~= 3)
             
        x = 'Null';
        return;
    else
        %Generate the solution in 
        x = quadform(coef(1),coef(2),coef(3));
        
    end
    
end

%Gets the coefficients of a depressed cubic shifted by x = y-(b/3a)
function x = quadform(a,b,c)
    x1 = (-b + sqrt(b^2 - 4*a*c))/(2*a); 
    x2 = (-b - sqrt(b^2 - 4*a*c))/(2*a);
    
    x = [x1;x2];
end

