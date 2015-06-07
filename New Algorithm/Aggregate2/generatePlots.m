%% Function generate Plots
%  genera los graficos de los resultados de
%  la agregacion.
%  Grafico 1: comparacion grafica de la matriz original
%  con la martiz aproximada
%  Grafico 2: evolucion de la tesa de divergencia
%  en el tiempo
function generatePlots(P,Q,R)
    
    % Grafico 1
    figure(1);
    subplot (1, 2, 1);
    imagesc(P);
    title('Matriz Original','FontSize',14);
    colorbar;
    subplot (1, 2, 2);
    imagesc(Q);
    title('Matriz reducida','FontSize',14);
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
    
    %Grafico 2
    
    figure(2);
    plot(R,'-o','linewidth',2);
    grid on;
    
    xlabel('Iteracion','FontSize',14);
    ylabel('Tasa de Divergencia','FontSize',14);
    
    %H = 3; W = 4;
    %set(f2,'PaperUnits','inches')
    %set(f2,'PaperOrientation','portrait');
    %set(f2,'PaperSize',[H,W])
    %set(f2,'PaperPosition',[0,0,W,H])
    %print(f2,'-dpng','-color',strcat(t,'Grafico2.png'));
    
    
end
