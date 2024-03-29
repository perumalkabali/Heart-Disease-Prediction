# Heart-Disease-Prediction
# Heart Disease Prediction using Support Vector Machine (SVM)

## Introduction

Data modeling involves identifying patterns and insights from large datasets using statistical methods and machine learning algorithms. Machine learning algorithms are broadly classified into supervised and unsupervised learning models based on whether the output variable is labeled or not. In supervised learning, classification algorithms like decision trees or random forests are used for discrete or categorical output variables, while regression algorithms are used for numeric output variables. Support Vector Machine (SVM) is a classification algorithm used to separate two classes of target data by a hyperplane with maximum margin, suitable for high-dimensional datasets. This project focuses on analyzing a heart disease dataset with 14 variables and 300 records to predict the presence of heart disease.

## Methods & Analysis

### 1. Libraries Used

The `caret` package (Classification and Regression Training) is used for building and training complex classification and regression problems, including data splitting, pre-processing, feature selection, and tuning.

### 2. Loading the Dataset

The dataset provided is `heart_tidy.csv`, a comma-separated values file. It is loaded into R using the `read.csv()` function, and the structure of the dataframe is checked using `str()`.

### 3. Exploratory Data Analysis

- **Structure of the Dataset:** The dataframe has 300 observations and 14 variables, with the target variable as the 14th column.
- **Data Splicing:** The dataset is split into training and testing sets with a 70:30 ratio.
- **Handling Missing Values:** There are no missing values in the dataset.
- **Summary Statistics:** Descriptive statistics of the dataframe are obtained using the `summary()` function.
- **Data Standardization:** The predictor variables are standardized.
- **Class of Target Variable:** The target variable is converted into a factor.

### 4. Model Building

- **SVM Classifier using Linear Kernel:** SVM with a linear kernel is built using the `train()` function with default parameters.
- **Testing the Model:** The model is tested on the test dataset, and accuracy is evaluated using confusion matrix.
- **Tuning the Model:** The model is tuned by adjusting the cost parameter for better accuracy.
- **SVM Classifier using Non-Linear Kernel:** SVM with radial and polynomial kernels are built and compared with the linear kernel.
- **Comparison between SVM Models:** Test accuracy of each SVM model is compared.

## Conclusion

Based on the results, SVM Linear classifier is identified as the best predictive model for heart disease prediction with an accuracy of 92.22%. SVM demonstrates promising performance for predicting heart disease using the given dataset.

## References

1. The 5th Tribe, Support Vector Machines and caret. (n.d.). Revolutions. Retrieved from [link](https://blog.revolutionanalytics.com/2015/10/the-5th-tribe-support-vector-machines-and-caret.html)
2. Bank Telemarketing NN & SVM. (n.d.). Nselvar.github.io. Retrieved from [link](https://nselvar.github.io/bank-telemarketing/)
