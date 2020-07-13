SAS-L: Benchmarks for python pyreadstat vs pandas read_sas for inporting sas7bdats                                                         
                                                                                                                                           
Pyreadstat appears to be much faster than pandas read_sas.                                                                                 
                                                                                                                                           
Win 10 64bit SAS 9.4M6 64bit                                                                                                               
                                                                                                                                           
github                                                                                                                                     
https://tinyurl.com/yd4esoo5                                                                                                               
https://github.com/rogerjdeangelis/utl-benchmarks-for-python-pyreadstat-vs-pandas-read_sas-for-inporting-sas7bdats                         
                                                                                                                                           
I have plenty of RAM (128gb)                                                                                                               
As is often the case, it may be looping is slower sequential I/O.                                                                          
                                                                                                                                           
Benchmark python pyreadstat vs pandas read_sas for inporting sas7bdats                                                                     
                                                                                                                                           
Import a 686mb sas7bdat 4,280,000 observations with Observation Length 160 bytes                                                           
                                                                                                                                           
  Benchmarks                                                Seconds                                                                        
  ==========                                                =======                                                                        
                                                                                                                                           
  pyreadstat                                                   26                                                                          
                                                                                                                                           
  paddas read_sas without chunksize                            78   * wonder if read_sas is looking for CR/LF on windows?                  
                                                                                                                                           
  paddas read_sas without chunksize=5000                                                                                                   
  (5000 obs * 160 byte bhunk bytes=800k))                      94   * wonder if read_sas is looking for CR/LF on windows?                  
                                                                    * loops do not halp?                                                   
Pyreadstat appears to be much faster than pandas read_sas.                                                                                 
I have also had good luck with pyreadstat write_xport.                                                                                     
                                                                                                                                           
SOAPBOX ON                                                                                                                                 
Pyreadstat seems to handle the 'object' data type by converting it                                                                         
to a string automatically while other packages require                                                                                     
knowledge of the many oddities of the python 'object' data type.                                                                           
                                                                                                                                           
Python seems to have more datatypes and data structures than R. Python                                                                     
is a legend in own mind and does not play well outside its sandbox?                                                                        
                                                                                                                                           
Less is more?                                                                                                                              
                                                                                                                                           
SOAPOX OFF                                                                                                                                 
                                                                                                                                           
github related repos                                                                                                                       
https://tinyurl.com/y9ywchvq                                                                                                               
https://github.com/rogerjdeangelis?tab=repositories&q=pyreadstat+in%3Areadme&type=&language=                                               
                                                                                                                                           
/*                   _                                                                                                                     
(_)_ __  _ __  _   _| |_                                                                                                                   
| | `_ \| `_ \| | | | __|                                                                                                                  
| | | | | |_) | |_| | |_                                                                                                                   
|_|_| |_| .__/ \__,_|\__|                                                                                                                  
        |_|                                                                                                                                
*/                                                                                                                                         
                                                                                                                                           
* 686mb;                                                                                                                                   
options validvarname=upcase;                                                                                                               
libname sd1 "d:/sd1";                                                                                                                      
data sd1.have70mb;                                                                                                                         
                                                                                                                                           
  set sashelp.cars;                                                                                                                        
                                                                                                                                           
  do i=1 to 10000;                                                                                                                         
     output;                                                                                                                               
  end;                                                                                                                                     
                                                                                                                                           
run;quit;                                                                                                                                  
                                                                                                                                           
SD1.HAVE70MB  Observations          4,280,000                                                                                              
Observation Length                        160                                                                                              
Data Representation  WINDOWS_64                                                                                                            
                                                                                                                                           
Engine/Host Dependent Information                                                                                                          
                                                                                                                                           
Filename                    d:\sd1\have70mb.sas7bdat                                                                                       
Release Created             9.0401M6                                                                                                       
Host Created                X64_10PRO                                                                                                      
File Size                   654MB                                                                                                          
File Size (bytes)           685899776                                                                                                      
                                                                                                                                           
#    Variable       Type    Len                                                                                                            
                                                                                                                                           
 1  MAKE           Char     13                                                                                                             
 2  MODEL          Char     40                                                                                                             
 3  TYPE           Char      8                                                                                                             
 4  ORIGIN         Char      6                                                                                                             
 5  DRIVETRAIN     Char      5                                                                                                             
 6  MSRP           Num       8                                                                                                             
 7  INVOICE        Num       8                                                                                                             
 8  ENGINESIZE     Num       8                                                                                                             
 9  CYLINDERS      Num       8                                                                                                             
10  HORSEPOWER     Num       8                                                                                                             
11  MPG_CITY       Num       8                                                                                                             
12  MPG_HIGHWAY    Num       8                                                                                                             
13  WEIGHT         Num       8                                                                                                             
14  WHEELBASE      Num       8                                                                                                             
15  LENGTH         Num       8                                                                                                             
16  I              Num       8                                                                                                             
*/                                                                                                                                         
                                                                                                                                           
/*           _               _                                                                                                             
  ___  _   _| |_ _ __  _   _| |_                                                                                                           
 / _ \| | | | __| `_ \| | | | __|                                                                                                          
| (_) | |_| | |_| |_) | |_| | |_                                                                                                           
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                          
                |_|             _     _        _                                                                                           
 _ __  _   _ _ __ ___  __ _  __| |___| |_ __ _| |_                                                                                         
| `_ \| | | | `__/ _ \/ _` |/ _` / __| __/ _` | __|                                                                                        
| |_) | |_| | | |  __/ (_| | (_| \__ \ || (_| | |_                                                                                         
| .__/ \__, |_|  \___|\__,_|\__,_|___/\__\__,_|\__|                                                                                        
|_|    |___/                                                                                                                               
*/                                                                                                                                         
                                                                                                                                           
<class 'pandas.core.frame.DataFrame'>                                                                                                      
RangeIndex: 4,280,000 entries, 0 to 4279999                                                                                                
Data columns (total 16 columns):                                                                                                           
 #   Column       Dtype                                                                                                                    
---  ------       -----                                                                                                                    
 0   MAKE         object                                                                                                                   
 1   MODEL        object                                                                                                                   
 2   TYPE         object                                                                                                                   
 3   ORIGIN       object                                                                                                                   
 4   DRIVETRAIN   object                                                                                                                   
 5   MSRP         float64                                                                                                                  
 6   INVOICE      float64                                                                                                                  
 7   ENGINESIZE   float64                                                                                                                  
 8   CYLINDERS    float64                                                                                                                  
 9   HORSEPOWER   float64                                                                                                                  
 10  MPG_CITY     float64                                                                                                                  
 11  MPG_HIGHWAY  float64                                                                                                                  
 12  WEIGHT       float64                                                                                                                  
 13  WHEELBASE    float64                                                                                                                  
 14  LENGTH       float64                                                                                                                  
 15  I            float64                                                                                                                  
dtypes: float64(11), object(5)                                                                                                             
memory usage: 522.5+ MB                                                                                                                    
                                                                                                                                           
/*              _                                                                                                                          
 _ __ ___   ___| |_ __ _                                                                                                                   
| `_ ` _ \ / _ \ __/ _` |                                                                                                                  
| | | | | |  __/ || (_| |                                                                                                                  
|_| |_| |_|\___|\__\__,_|                                                                                                                  
                                                                                                                                           
*/                                                                                                                                         
                                                                                                                                           
Observations=4280000                                                                                                                       
VARIABLES=16                                                                                                                               
DataFrameName=HAVE70MB                                                                                                                     
ENCODING=WINDOWS-1252                                                                                                                      
ROW COLS = [4280000 rows x 16 columns]                                                                                                     
Datatypes: float64(11), object(5)                                                                                                          
HEAD TAIL                                                                                                                                  
memory usage: 522.5+ MB                                                                                                                    
          MAKE  MODEL   TYPE  ORIGIN  ...  WEIGHT  WHEELBASE  LENGTH        I                                                              
0        Acura    MDX    SUV    Asia  ...  4451.0      106.0   189.0      1.0                                                              
1        Acura    MDX    SUV    Asia  ...  4451.0      106.0   189.0      2.0                                                              
2        Acura    MDX    SUV    Asia  ...  4451.0      106.0   189.0      3.0                                                              
3        Acura    MDX    SUV    Asia  ...  4451.0      106.0   189.0      4.0                                                              
4        Acura    MDX    SUV    Asia  ...  4451.0      106.0   189.0      5.0                                                              
...        ...    ...    ...     ...  ...     ...        ...     ...      ...                                                              
4279995  Volvo   XC70  Wagon  Europe  ...  3823.0      109.0   186.0   9996.0                                                              
4279996  Volvo   XC70  Wagon  Europe  ...  3823.0      109.0   186.0   9997.0                                                              
4279997  Volvo   XC70  Wagon  Europe  ...  3823.0      109.0   186.0   9998.0                                                              
4279998  Volvo   XC70  Wagon  Europe  ...  3823.0      109.0   186.0   9999.0                                                              
4279999  Volvo   XC70  Wagon  Europe  ...  3823.0      109.0   186.0  10000.0                                                              
                                                                                                                                           
VARIABLE                                                                                                                                   
                                                                                                                                           
['MAKE', 'MODEL', 'TYPE', 'ORIGIN', 'DRIVETRAIN', 'MSRP', 'INVOICE', 'ENGINESIZE',                                                         
'CYLINDERS', 'HORSEPOWER', 'MPG_CITY', 'MPG_HIGHWAY', 'WEIGHT', 'WHEELBASE', 'LENGTH', 'I']                                                
                                                                                                                                           
LABELS                                                                                                                                     
                                                                                                                                           
[None, None, None, None, None, None, None, 'Engine Size (L)', None, None, 'MPG (City)', 'MPG (Highway)',                                   
'Weight (LBS)', 'Wheelbase (IN)', 'Length (IN)', None]                                                                                     
{'MAKE': None, 'MODEL': None, 'TYPE': None, 'ORIGIN': None, 'DRIVETRAIN': None, 'MSRP': None,                                              
'INVOICE': None, 'ENGINESIZE': 'Engine Size (L)', 'CYLINDERS': None, 'HORSEPOWER': None,                                                   
'MPG_CITY': 'MPG (City)', 'MPG_HIGHWAY': 'MPG (Highway)', 'WEIGHT': 'Weight (LBS)',                                                        
'WHEELBASE': 'Wheelbase (IN)', 'LENGTH': 'Length (IN)', 'I': None}                                                                         
                                                                                                                                           
/*                     _                                _                                                                                  
 _ __   __ _ _ __   __| | __ _ ___   _ __ ___  __ _  __| |    ___  __ _ ___                                                                
| `_ \ / _` | `_ \ / _` |/ _` / __| | `__/ _ \/ _` |/ _` |   / __|/ _` / __|                                                               
| |_) | (_| | | | | (_| | (_| \__ \ | | |  __/ (_| | (_| |   \__ \ (_| \__ \                                                               
| .__/ \__,_|_| |_|\__,_|\__,_|___/ |_|  \___|\__,_|\__,_|___|___/\__,_|___/                                                               
|_|                                                     |_____|                                                                            
*/                                                                                                                                         
                                                                                                                                           
<class 'pandas.core.frame.DataFrame'>                                                                                                      
RangeIndex: 4280000 entries, 0 to 4279999                                                                                                  
Data columns (total 16 columns):                                                                                                           
 #   Column       Dtype                                                                                                                    
---  ------       -----                                                                                                                    
 0   MAKE         object                                                                                                                   
 1   MODEL        object                                                                                                                   
 2   TYPE         object                                                                                                                   
 3   ORIGIN       object                                                                                                                   
 4   DRIVETRAIN   object                                                                                                                   
 5   MSRP         float64                                                                                                                  
 6   INVOICE      float64                                                                                                                  
 7   ENGINESIZE   float64                                                                                                                  
 8   CYLINDERS    float64                                                                                                                  
 9   HORSEPOWER   float64                                                                                                                  
 10  MPG_CITY     float64                                                                                                                  
 11  MPG_HIGHWAY  float64                                                                                                                  
 12  WEIGHT       float64                                                                                                                  
 13  WHEELBASE    float64                                                                                                                  
 14  LENGTH       float64                                                                                                                  
 15  I            float64                                                                                                                  
dtypes: float64(11), object(5)                                                                                                             
memory usage: 522.5+ MB                                                                                                                    
                                                                                                                                           
                                                                                                                                           
/*         _       _   _                                                                                                                   
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                                   
/ __|/ _ \| | | | | __| |/ _ \| `_ \/ __|                                                                                                  
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                                  
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                                  
                                                                                                                                           
*/                                                                                                                                         
                                                                                                                                           
* 686mb;                                                                                                                                   
options validvarname=upcase;                                                                                                               
libname sd1 "d:/sd1";                                                                                                                      
data sd1.have70mb;                                                                                                                         
                                                                                                                                           
  set sashelp.cars;                                                                                                                        
                                                                                                                                           
  do i=1 to 10000;                                                                                                                         
     output;                                                                                                                               
  end;                                                                                                                                     
                                                                                                                                           
run;quit;                                                                                                                                  
                                                                                                                                           
/*                              _     _        _                                                                                           
 _ __  _   _ _ __ ___  __ _  __| |___| |_ __ _| |_                                                                                         
| `_ \| | | | `__/ _ \/ _` |/ _` / __| __/ _` | __|                                                                                        
| |_) | |_| | | |  __/ (_| | (_| \__ \ || (_| | |_                                                                                         
| .__/ \__, |_|  \___|\__,_|\__,_|___/\__\__,_|\__|                                                                                        
|_|    |___/                                                                                                                               
*/                                                                                                                                         
                                                                                                                                           
%utl_submit_py64_38('                                                                                                                      
import pandas as pd;                                                                                                                       
import pyreadstat;                                                                                                                         
want, meta = pyreadstat.read_sas7bdat("d:/sd1/have70mb.sas7bdat");                                                                         
want.info();                                                                                                                               
print(want);                                                                                                                               
print(meta.column_names);                                                                                                                  
print(meta.column_labels);                                                                                                                 
print(meta.column_names_to_labels);                                                                                                        
print(meta.number_rows);                                                                                                                   
print(meta.number_columns);                                                                                                                
print(meta.file_label);                                                                                                                    
print(meta.file_encoding);                                                                                                                 
');                                                                                                                                        
                                                                                                                                           
/*                     _                            _                                                                                      
 _ __   __ _ _ __   __| | __ _   _ __ ___  __ _  __| |    ___  __ _ ___                                                                    
| `_ \ / _` | `_ \ / _` |/ _` | | `__/ _ \/ _` |/ _` |   / __|/ _` / __|                                                                   
| |_) | (_| | | | | (_| | (_| | | | |  __/ (_| | (_| |   \__ \ (_| \__ \                                                                   
| .__/ \__,_|_| |_|\__,_|\__,_| |_|  \___|\__,_|\__,_|___|___/\__,_|___/                                                                   
|_|                                                 |_____|                                                                                
*/                                                                                                                                         
                                                                                                                                           
                                                                                                                                           
%utl_submit_py64_38("                                                                                                                      
import pandas as pd;                                                                                                                       
want_data=[];                                                                                                                              
want=pd.read_sas('d:/sd1/have70mb.sas7bdat',encoding='ascii',chunksize=5000,iterator=True);                                                
for chunk in want:;                                                                                                                        
.    want_data.append(chunk);                                                                                                              
want_data_df=pd.concat(want_data);                                                                                                         
want_data_df.info();                                                                                                                       
");                                                                                                                                        
                                                                                                                                           
%utl_submit_py64_38("                                                                                                                      
import pandas as pd;                                                                                                                       
want=pd.read_sas('d:/sd1/have70mb.sas7bdat',encoding='ascii');                                                                             
want.info();                                                                                                                               
");                                                                                                                                        
                                                                                                                                           
