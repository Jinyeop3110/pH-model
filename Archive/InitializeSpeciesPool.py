import numpy as np
from scipy.integrate import solve_ivp
import matplotlib.pyplot as plt
import os
import pandas as pd
import seaborn as sns
from IPython.display import clear_output
import random
#import openpyxl
import csv


# define the Generalized Lotka-Volterra model
def InitializeSpeceiesPool_ver1(N, N_env, f_interaction, f_g = lambda :np.ones(1), f_k = lambda :np.ones(1), f_p = lambda :np.ones(1), f_q = lambda :np.ones(1), is_diagonal_one=True, save_path="results/test"):
    
    params = {'N': N,
          'f_interaction': f_interaction.__name__,
         'f_g': f_g.__name__,
         'f_k': f_k.__name__,
         'f_p': f_p.__name__,
              'f_q': f_q.__name__,
             'is_diagonal_one' : is_diagonal_one}
    if not os.path.exists(save_path):
        # Create folder if it does not exist
        os.makedirs(save_path)
        print(f"Folder '{save_path}' created.")
    else:
        print(f"Folder '{save_path}' already exists.")

    I = np.zeros((N, N))
    for i in range(N):
        for j in range(N):
            I[i,j] = f_interaction()
    for i in range(N):
        I[i,i] =1
              
    g = np.zeros((N))
    for i in range(N):
        g[i] = f_g()
        
    k = np.zeros((N))
    for i in range(N):
        k[i] = f_k()   

    p = np.zeros((N_env, N))
    for i in range(N_env):
        for j in range(N):
            p[i,j] = f_p()

    q = np.zeros((N, N_env))
    for i in range(N):
        for j in range(N_env):
            q[i,j] = f_q()
            
    df1=pd.DataFrame({'g':g, 'k':k})
    df2=pd.DataFrame(I)
    
    file_path = f'{save_path}/parameter.xlsx'

    # Writing DataFrames to different sheets in the same Excel file
    with pd.ExcelWriter(file_path) as writer:
        df1.to_excel(writer, sheet_name='Sheet1', index=False)
        df2.to_excel(writer, sheet_name='Sheet2', index=False)

    # Return statement as per your code
    return I, np.array([g]), np.array([k]), p, q
  
