function[result] = Simpsons1by3(f,a,b)
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
end