# GPR_FVD_Prediction_models
Gaussian Process Regression models to predict the seismic response of structural systems equipped with fluid viscous dampers.

Two different sets of prediction models were created by using the median seismic response of the structural systems equipped with FVDs normalized with respect to the median seismic response of the control structural systems without FVDs, reducing thus the influence of the structural systems in the prediction models. The predicted response values of the systems equipped with FVDs are obtained by multiplying the computed normalized value from the prediction models by the corresponding response value of the system without FVDs. The first set of prediction models was based on the results of the parametric study on the seismic response of SDoF systems equipped with FVDs (Chapter 3). This set is composed of four prediction models aiming to forecast the normalized peak relative displacement, normalized peak relative velocity, normalized peak absolute acceleration, and normalized peak mass spectral absolute acceleration of SDoF systems equipped with FVDs. The input parameters of the prediction models were defined as the fundamental period of the SDoF system (T1), the Maxwell material stiffness described as a ratio between the Maxwell material stiffness and the system stiffness (Kd⁄Kmod ), the targeted supplemental damping ratio (ξ), the velocity exponent (α), and the spectral acceleration at a period of 1.0 s (Sa(T=1s)) of the input records. The second set of prediction models was based on the results of the parametric study on the seismic response of steel moment-resisting frames equipped with FVDs (Chapter 4). This set is composed of six prediction models aiming to forecast the normalized peak inter-story drifts, normalized peak floor absolute acceleration, and normalized peak floor spectral absolute acceleration of steel moment-resisting frames equipped with FVDs designed with both design approaches explained in Chapter 2 (i.e., ELS and UD). The input parameters of the prediction models were defined as the number of stories, the ratio of the floor’s height and the total building’s height (z⁄H), the fundamental period of the frame (T1), the Maxwell material stiffness described as a ratio between the Maxwell material stiffness and lateral floor stiffness (i.e., Kd⁄Kf ), the targeted supplemental damping ratio (ξ), the velocity exponent (α), and the spectral acceleration at a period of 1.0 s (Sa(T=1s)) of the input records.
