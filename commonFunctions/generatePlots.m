% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%% Function generate Plots
%  Generate plots with the results of aggregation.
%  Plot 1: Graphical comparison between original matrix and reduced matrix
%  Plot 2: Evolution of divergence rate per iteration 
function generatePlots(P,Q,R)
    
    % Plot 1
    figure(1); %f1 = figure(1);
    subplot (1, 2, 1); %h1 = subplot (1, 2, 1);
    imagesc(P);
    title('Original Matrix','FontSize',14);
    colorbar;
    subplot (1, 2, 2); %h2 = subplot (1, 2, 2);
    imagesc(Q);
    title('Reduced Matrix','FontSize',14);
    colorbar;
    
    %FN = findall(f1,'-property','FontName');
    %set(FN,'FontName','/usr/share/fonts/dejavu/DejaVuSerifCondensed.ttf');
    %FS = findall(f1,'-property','FontSize');
    %set(FS,'FontSize',6);
    
    %H = 3; W = 4;
    %set(f1,'PaperUnits','inches')
    %set(f1,'PaperOrientation','portrait');
    %set(f1,'PaperSize',[H,W])
    %set(f1,'PaperPosition',[0,0,W,H])
    %print(f1,'-dpng','-color',strcat(t,'Grafico1.png'));
    
    % Plot 2
    
    figure(2); %f2 = figure(2);
    plot(R,'-o','linewidth',2);
    grid on;
    
    xlabel('Iteration','FontSize',14);
    ylabel('Divergence Rate','FontSize',14);
    
    %H = 3; W = 4;
    %set(f2,'PaperUnits','inches')
    %set(f2,'PaperOrientation','portrait');
    %set(f2,'PaperSize',[H,W])
    %set(f2,'PaperPosition',[0,0,W,H])
    %print(f2,'-dpng','-color',strcat(t,'Grafico2.png'));
    
    
end
