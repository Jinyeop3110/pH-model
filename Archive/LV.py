import numpy as np
from scipy.integrate import odeint


def gLV(y, t, I_simul, g_simul, k_simul):
    dydt = np.zeros_like(y)
    for i in range(len(y)):
        dydt[i] = g_simul[i]* y[i] * (1- np.sum(I_simul[i,:] * y)/k_simul[i])
    return dydt

def gLV_pH_set1(y, t, I_simul, g_simul, k_simul, p_simul, q_simul, varIdx):
    # p_simul : species -> pH
    # q_simul : pH -> species
    dydt = np.zeros(len(varIdx['env']) + len(varIdx['species']))

    growth_rate_multiplier = 1 - (np.matmul(I_simul,y[varIdx['species']])) / k_simul + np.matmul(q_simul, y[varIdx['env']])
        
    dydt[varIdx['species']] = np.multiply(np.multiply(y[varIdx['species']], mu),growth_rate_multiplier) - death_rate * y[varIdx['species']] + migration_rate
    dydt[varIdx['env']] = delta * (-y[varIdx['env']] + beta * np.multiply(p_simul, y[varIdx['species']]) - 0.001 * y[varIdx['env']]**3)
        
    return dydt

def run_lotka_volterra_dynamics(y0, t, s_idx, I, g, k):
    
    s_idx=np.where(s_idx)[0].tolist()
    N=len(y0)
    y0_simul=y0[s_idx]
    I_simul=I[s_idx,:]
    I_simul=I_simul[:,s_idx]
    g_simul=g[s_idx]
    k_simul=k[s_idx]
    
    
    y = odeint(gLV, y0_simul, t, args=(I_simul, g_simul, k_simul))
    y_out=np.zeros(N)
    for i in range(y.shape[1]):
        y_out[s_idx[i]]=y[-1,i] 
    return y
