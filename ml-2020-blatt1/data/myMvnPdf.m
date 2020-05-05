%% Maschinelles Lernen SoSe 2020 Uebungsblatt 1 Aufgabe 3
%% Multivariate Normal probability density function

function myMvnPdf( mu, varianceX1, varianceX2, covarianceX1X2, zmax )

% mu of the two random variables.
%% TODO
% mu = [0 0];

% covariance matrix
% varianceX1 = 1;
% varianceX2 = 1;
%% TODO
% covarianceX1X2 = 0;
covarianceMatrix = [varianceX1 covarianceX1X2; covarianceX1X2 varianceX2];

%% Hint: not important for your assignment below here!
% Alles Folgende dient dem Plotten der W-Dichte der multivarianten
% Normalverteilung mit den obigen Parametern

%% 2D-Gitter f?r die (x,y)-Koordinaten des Plots
% resolution of plot
resolution = 0.1;

% x and y arguments
xArgs = -3 : resolution : 3; 
yArgs = -3 : resolution : 3;

% map to grid -> Erstelle das Gitter
[X1,X2] = meshgrid(xArgs, yArgs);

%% Berechne nun die W-Dichte zu den gew?hlten Parametern (zum Gitter oben)
% calculate pdf
F = mvnpdf([X1(:) X2(:)], mu, covarianceMatrix);

% F is a vector, shape it to matrix form.
F = reshape(F, length(yArgs), length(xArgs));

%% Plotte nun den Graphen der W-Dichtefunktion
% plot the function values
surf(xArgs, yArgs, F);

% Coloring of the graph
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);

% axis limits
axis([-3 3 -3 3 0 zmax])

% Schriftaenderungen
set( 0, 'defaultTextFontName', 'Times' );
set( 0, 'defaultAxesFontName', 'Times' );

% Schriftaenderung der Achsen
ax = gca;
ax.FontName='Times';

% Formatting: axis labels
xlabel('Zufallsvariable X'); 
ylabel('Zufallsvariable Y');
zlabel({'$f_{X,Y}$'}, 'Interpreter', 'latex');

end
