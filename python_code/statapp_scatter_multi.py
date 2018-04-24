import numpy as np
import pandas as pd
import sys, os, time, copy, scipy
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.externals import joblib 
from sklearn.metrics import confusion_matrix 
 
def extract_features_torques(features,labels):
    torques = [element[0][0:-1:100] for element in features]
            
    mean_torques = [np.mean(element) for element in torques]
    std_torques = [np.std(element) for element in torques]
    mode_torques = [scipy.stats.mode(element)[0][0] for element in torques]
    median_torques = [np.median(element) for element in torques]
    
    for i in range(len(labels)):
        if labels[i]=='working':
            labels[i]=0
        if labels[i]=='grass':
            labels[i]=1    
        if labels[i]=='rotturadenti':
            labels[i]=2
        if labels[i]=='piegatura':
            labels[i]=3
    
    new_features = []
    for i in range(len(mean_torques)):
        new_features.append(np.array([mean_torques[i],std_torques[i],mode_torques[i],median_torques[i],labels[i]]).reshape(-1))
    return new_features
    
def extract_features_currents(features,labels):
    currents = [element[1][0:-1:100] for element in features]
            
    mean_currents = [np.mean(element) for element in currents]
    std_currents = [np.std(element) for element in currents]
    mode_currents = [scipy.stats.mode(element)[0][0] for element in currents]
    median_currents = [np.median(element) for element in currents]

    for i in range(len(labels)):
        if labels[i]=='working':
            labels[i]=0
        if labels[i]=='grass':
            labels[i]=1    
        if labels[i]=='rotturadenti':
            labels[i]=2
        if labels[i]=='piegatura':
            labels[i]=3
        
    new_features = []
    for i in range(len(mean_currents)):
        new_features.append(np.array([mean_currents[i],std_currents[i],mode_currents[i],median_currents[i],labels[i]]).reshape(-1))
    return new_features
    
if __name__ == "__main__":

    start_time = time.time()    
    
    data = joblib.load(os.path.join('serialized_data','data_dc_multiclass.pkl'))
     
    labels = data[0]
    features = [(torque,current) for torque,current in zip(data[1],data[2])]
        
    SCATTER_MATRIX_CURRENTS=True
    if SCATTER_MATRIX_CURRENTS:     
        col_labels = ['mean_cur','std_cur','mode_cur','median_cur','label']
        df = pd.DataFrame(data=extract_features_currents(features,labels),columns=col_labels)
        sns.set()
        pal = sns.color_palette(palette='Set1',n_colors=4)       
        g = sns.pairplot(df,hue='label',palette=pal,vars=col_labels[:-1])
        g.set(yticks=[])
        g.set(xticks=[])
        new_labels = ['grass', 'rott', 'piega', 'working']
        for t, l in zip(g._legend.texts, new_labels): 
            t.set_text(l)
        plt.savefig(os.path.join('imgs','scattermatrix_currents_multi.pdf'),format='pdf',dpi=1200)
        
    SCATTER_MATRIX_TORQUES=True
    if SCATTER_MATRIX_TORQUES:
        col_labels = ['mean_torq','std_torq','mode_torq','median_torq','label']
        df = pd.DataFrame(data=extract_features_torques(features,labels),columns=col_labels)
        sns.set()
        pal = sns.color_palette(palette='Set1',n_colors=4)
        g = sns.pairplot(df,hue='label',palette=pal,vars=col_labels[:-1])
        g.set(yticks=[])
        g.set(xticks=[])
        new_labels = ['grass', 'rott', 'piega', 'working']
        for t, l in zip(g._legend.texts, new_labels): 
            t.set_text(l)
        plt.savefig(os.path.join('imgs','scattermatrix_torques_multi.pdf'),format='pdf',dpi=1200)        
     
    elapsed = (time.time() - start_time)/60
    print()
    print('Total Time: ' + str(elapsed))    
    
    
