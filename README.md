  # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Benjamin Stiyer and Santiago Velasquez

  ## Summary of Findings
  <Show the variations studied in a table>

  Summarized what was accomplished in this study.  Describe 2-4 observations from simulating the flight path.
  Reference the figures below as needed.

  *If the analysis falls short of the goal, this is your chance to explain what was done or what were the barriers.*
 
  # Code Listing
  A list of each function/script and a single-line description of what it does.  The name of the function/script should link to the file in the repository on GitHub.
  * [Paper Plane](PaperPlane.m)
      * Main function, runs all sections
  * [Set-up Simulation](SetupSim.m)
      * This function initializes simulation parameters and computes initial values for velocity, flight path angle, height, and range of a paper airplane based on aerodynamic and environmental conditions.
  * [Equations of Motion](EqMotion.m)
      * Models the fourth-order equations governing aircraft motion, returning the rates of change of velocity, flight path angle, and the components of velocity, respectively.
  
  # Figures

  ## Fig. 1: Single Parameter Variation
  ![VaryingSpecificValsFig](https://github.com/stiye010/aem3103-final/assets/167140587/39057b9c-5204-41b4-a7fa-1d637447c200)

  Briefly describe what is being shown in the figure.

  ## Fig. 2: Monte Carlo Simulation
  ![100Runs+CurveFitting](https://github.com/stiye010/aem3103-final/assets/167140587/3c9f84c3-5731-47bd-85d6-0444c4c8f090)

  The figure above shows the impact of simultaneous variations when using a uniform random number generator to pick parameters within their expected range. A single run will pick random values for all parameters and simulate the 2D trajectory. This process was repeated 100 times, so each gray line seen above symbolizes a run with random parameters. Furthermore, the thicker black line represents the result of curve-fitting those 100 random runs and using high-order polynomials to plot the best fit of the results.

 ## Fig. 3: Time Derivatives
 ![TimeDerivativeFig](https://github.com/stiye010/aem3103-final/assets/167140587/ddee420f-10f4-4d59-943e-a68bd1ebc3b7)

  The figure above shows the time derivations for the curve-fitted line seen in [Figure 2](##Fig.-2:-Monte-Carlo-Simulation). The time derivatives were taken using ...

  # Animation
  ![Animation](https://github.com/stiye010/aem3103-final/assets/167140587/25a0ebf2-61f0-4696-9d7a-1ec301191afb)
  
  Animated GIF showing 2D trajectory for nominal and the scenario (V=7.5 m/s, Gam=+0.4 rad)
