import numpy as np
import pandas as pd
import sys, os, time, copy, scipy
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.externals import joblib 
from sklearn.metrics import confusion_matrix 
from sklearn.decomposition import PCA
  
def pad(features):
    max_rows = 0
    for element in features:
        if element.shape[0]>max_rows:
            max_rows = element.shape[0]
    padded_features = []        
    for element in features:
        padded = np.zeros((max_rows,))
        padded[:] = np.mean(element)
        padded[:element.shape[0]] = element[:]
        padded_features.append(padded)         
    return padded_features  
  
if __name__ == "__main__":

    start_time = time.time()    
    
    data = joblib.load(os.path.join('serialized_data','data_dc_binary.pkl'))
     
    labels = data[0]
    features = [(torque,current) for torque,current in zip(data[1],data[2])]
    
    TORQUE=False
    if TORQUE:
        perc_comp_list =[0.99, 0.97, 0.95, 0.9, 0.85, 0.8, 0.75, 0.7, 0.65, 0.6] 
        n_comp_list = []
        torques = np.array(pad([element[0][0:-1:100] for element in features]))
        for n_comp in perc_comp_list:
            torques_pca = PCA(n_components=n_comp,whiten=True,svd_solver='full')
            reduced_torques = torques_pca.fit(torques)
            n_comp_list.append(torques_pca.n_components_)
        print(perc_comp_list)
        print(n_comp_list)  
        
    CURRENT=True
    if CURRENT:
        perc_comp_list =[0.99, 0.97, 0.95, 0.9, 0.85, 0.8, 0.75, 0.7, 0.65, 0.6]
        n_comp_list = []
        currents = np.array(pad([element[1][0:-1:100] for element in features]))
        for n_comp in perc_comp_list:
            currents_pca = PCA(n_components=n_comp,whiten=True,svd_solver='full')
            reduced_currents = currents_pca.fit(currents)
            n_comp_list.append(currents_pca.n_components_)
        print(perc_comp_list)
        print(n_comp_list)  

    y = n_comp_list           
    x = [int(element*100) for element in perc_comp_list]
    sns.set_style("darkgrid")
    sns.set_context("paper")
    plt.plot (x, y, linestyle='-', marker='o',markersize=4,color='blue',markeredgecolor='red',markeredgewidth=1,label='Number of Components')
    plt.legend(loc='best')
    plt.xlabel('% of Variability')
    plt.ylabel('Number of Components')
    plt.xticks(x)
    plt.gca().invert_xaxis() 
    plt.ylim((0,485)) 
    plt.savefig(os.path.join('imgs','n_pc_curr.pdf'),format='pdf',dpi=1200)
    sys.exit()  
     
    elapsed = (time.time() - start_time)/60
    print()
    print('Total Time: ' + str(elapsed))    
    
    
