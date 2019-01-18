from selenium import webdriver  
from pyvirtualdisplay import Display  
display = Display(visible=0, size=(800, 800))  
display.start()  
outputdir = "/tmp"  
options = webdriver.ChromeOptions()  
options.binary_location = '/usr/bin/google-chrome'  
service_log_path = "{}/chromedriver.download_tax_rates.log".format(outputdir)  
service_args = ['--verbose','--no-sandbox']  
driver = webdriver.Chrome('/usr/bin/chromedriver',  
        chrome_options=options,
        service_args=service_args,
        service_log_path=service_log_path)
#open connection
# driver = webdriver.Chrome()
#open chrome to first page
driver.get('https://www.advancedwebranking.com/')
print(driver.title) 
print((driver.page_source).encode('utf-8')) 
driver.close()  
display.stop()  