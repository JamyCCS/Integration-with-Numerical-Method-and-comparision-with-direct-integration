function[result] = Weddle(f,a,b)
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
end