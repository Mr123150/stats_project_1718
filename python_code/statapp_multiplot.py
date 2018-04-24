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
    torques = np.array([element[0][0:-1:100] for element in features])
        
    #colormap = plt.cm.gist_ncar
    #plt.gca().set_prop_cycle('color',[colormap(i) for i in np.linspace(0, 0.9, len(torques))])
    sns.set_style("darkgrid")
    sns.set_context("paper")
    
    for element in torques[0:100]:
        plt.plot(element,linewidth=0.5)
        
    #plt.xlabel('Time')
    #plt.ylabel('Torque') 
    plt.xticks([])
    plt.yticks([])
     
    plt.savefig(os.path.join('imgs','multiplot.pdf'),format='pdf',dpi=1200)
     
    elapsed = (time.time() - start_time)/60
    print()
    print('Total Time: ' + str(elapsed))    
    
    
