% %Example of user input MATLAB file for post processing
% 
% % Plot wave surface elevation
% waves.plotEta();
% % 
% % %Plot heave response for body 1
% output.plotResponse(1,3);
% % 
% % % %Plot heave response for body 2
% % % output.plotResponse(2,3);
% % 
% % %Plot heave forces for body 1
% output.plotForces(1,3);
% % 
% % % %Plot pitch moments for body 2
% % % output.plotForces(2,5);
% 
% 
% figure
% % plot(x,y1,'g',x,y2,'b--o'
%  plot(waves.waveAmpTime(:,1),waves.waveAmpTime(:,end),'g',waves.waveAmpTime(:,1),output.bodies.position(:,3),'b')
%  
%  mean (ptoUSERPOWER.signals.values(:,3))
mean(ptoUSERPOWER.signals.values(:,3))

mean (output.ptos(1).powerInternalMechanics(:,3))