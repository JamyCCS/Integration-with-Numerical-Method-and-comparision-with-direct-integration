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
                            N = input('Enter the division number. More division means more accuracy but more computation is needed \n'); % Number of divisions
                            
                            % Calculation of Step Size
                            h = (b - a) / N;
                            
                            % Initialization
                            sum = 0;
                            
                            % Loop for Summation
                            for i = 1:N-1
                                sum = sum + f(a + i * h);
                            end
                            
                            % Calculation of Result
                            result = (h / 2) * (f(a) + 2 * sum + f(b));
                            
                            % Display Result
                            fprintf("Result of the integration\n");
                            fprintf("by Trapezoidal Rule:\n");
                            fprintf("%.6f\n\n", result);
                    
                    elseif(m==2) % Simpson 1/3
                            N = input('Enter the division number. More division means more accuracy but more computation is needed \n'); % Number of divisions
                            
                            % Calculation of Step Size
                            h = (b - a) / N;
                    
                            % Initialization
                            sum = 0;
                            
                            % Loop for Summation
                            for i = 1:N-1
	                            if mod(i, 2) == 0
                                    sum = sum + f(a + i * h) * 2;
                                else
                                    sum = sum + f(a + i * h) * 4;
	                            end
                            end
                            
                            result = (h / 3) * (f(a) + sum + f(b));
                            
                            fprintf("Result of the integration\n");
                            fprintf("by Simpson's 1/3 Rule:\n");
                            fprintf("%.6f\n\n", result);
                    
                    
                    elseif(m==3) % Simpson's 3/8
                            N = input('Enter the division number. More division means more accuracy but more computation is needed \n'); % Number of divisions
                            
                            % Calculation of Step Size
                            h = (b - a) / N;
                    
                            % Initialization
                            sum = 0;
                    
                            % Loop for Summation
                            for i = 1:N-1
                              if mod(i, 3) == 0
                                sum = sum + f(a + i * h) * 2;
                              else
                                sum = sum + f(a + i * h) * 3;
                              end
                            end
                            
                            result = (3 * h / 8) * (f(a) + sum + f(b));
                            
                            fprintf("Result of the integration\n");
                            fprintf("by Simpson's 3/8 Rule:\n");
                            fprintf("%.6f\n\n", result);
                    
                    elseif(m==4) % Weddle
                            N = input('Enter the division number. More division means more accuracy but more computation is needed \n'); % Number of divisions
                            
                            % Calculation of Step Size
                            h = (b - a) / N;
                    
                            % Initialization
                            sum6= 0;
                            sumODDnt3= 0;
                            sumEVENnt6=0;
                            sum3nt6=0;
                    
                            % Loop for Summation
                            for i = 1:N-1
                              if mod(i,2)==0 && mod(i,6)~=0 
                                  sumEVENnt6= sumEVENnt6 + f(a + i * h)*1;
                              end
                    
                              if mod(i,2)~=0 && mod(i,3)~=0 
                                  sumODDnt3= sumODDnt3 + f(a + i * h)*5;
                              end
                              
                              if mod(i,3)==0 && mod(i,6)~=0 
                                  sum3nt6= sum3nt6 + f(a + i * h)*6;
                              end
                              
                              if mod(i,6)==0
                                  sum6= sum6 + f(a + i * h)*2;
                              end
                            end
                    
                            result = (3 * h / 10) * (f(a) + sum6 + sumEVENnt6 + sumODDnt3 + sum3nt6 + f(b));
                            
                            fprintf("Result of the integration\n");
                            fprintf("by Weddle Rule:\n");
                            fprintf("%.6f\n\n", result);
                    
                            
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