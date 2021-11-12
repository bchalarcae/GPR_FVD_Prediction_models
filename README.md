# GPR_FVD_Prediction_models
# Parametric study and prediction models for the seismic response of steel moment-resisting frames equipped with fluid viscous dampers.

Gaussian Process Regression models to predict the peak inter-story drift (PISD),
peak floor absolute acceleration (PFAA), and the peak floor spectral absolute acceleration (PFSAA),
as a factor of such value in the equivalent steel moment-resisting frame without dampers.

To use the prediction models in MATLAB, open the MATLAB script "Prediction_models.m".
The input data to generate the prediction can be save in a txt file o be defined as a matrix in MATLAB.
The order of the variables is important. Each row represent a data point and each column a input variable:
total number of stories, fundamental period (s), Maxwell material stiffness as a fraction of the model stiffness (i.e., Kd⁄Kmod), supplemental damping ratio as % (e.g., 10), seismic intensity as the ground spectral acceleration at 1.0 s in g (e.g., 0.6 g), velocity exponent of FVD, and the ratio between the floor’s height and the total building’s height (i.e., z⁄H). [Ns T1 Kd⁄Kmod  Damp Sa1 Alpha z⁄H]. There are two sets of prediction models based on the design approach implemented to design the fluid viscous dampers, equivalent lateral stiffness (ELS) and uniform distribution (UD).

The *.mat files contain the GPR models including the original data point used to calibrate the models as well as all the parameters obtained
from the optimization process carried out by the Regression Learner app in MATLAB 2020b. Further information about the model calibration can be found at:

https://www.mathworks.com/help/stats/train-regression-models-in-regression-learner-app.html

The example steel frame use in Section 5.3.1 are used here as an example. Check the "Input.txt" file.

These files are available at Github:
https://github.com/bchalarcae/GPR_FVD_Prediction_models
or google drive
https://bit.ly/GPR_FVD_Prediction_models

Please feel free to contact the author to get further information.

