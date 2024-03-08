clc; 
clearvars; 
close all;
newMath = true;
while newMath
            % Input the equation
            equation_str = input('Enter the equation (use variable x): \n', 's');
            
            % Input parameters
            a = input('Enter the lower limit \n'); % Lower limit
            b = input('Enter the upper limit \n'); % Upper limit
            
            % Method Selections
            fprintf('Choose one from below\n 1)Trapezoidal \n 2)Simpsons 1/3 \n 3)Simpsons 3/8 \n 4)Weddle \n 5)Direct Integration \n');
            
            m=input('Enter the number \n');
            % Create a function or symbolic expression
            while m>0
                    if (m~=5)
                         f = str2func(['@(x) ', equation_str]);
                        
                    else
                        f= str2sym(equation_str);
                        
                    end
                    if(m==1) %Trapezoidal

                            Trapezoidal(f,a,b)

                    
                    elseif(m==2) % Simpson 1/3

                             Simpsons1by3(f,a,b)

                    
                    elseif(m==3) % Simpson's 3/8

                               Simpsons3by8(f,a,b)


                    elseif(m==4) % Weddle

                                Weddle(f,a,b)
                               
                            
                    elseif(m==5) % Direct Integration
                            % Perform the integration
                            result = int(f, a, b);
                            fprintf("Result of the integration\n");
                            fprintf("%.6f\n\n", result);
                    end
                    
                    m= input("Do another method? Put the method number or 0 to End \n");
             end
            newMath= logical(input("Do another math? 1 for yes 0 for no \n"));
end