function [result] = Trapezoidal(f,a,b)

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
end