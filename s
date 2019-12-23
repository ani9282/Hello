data.xml file :
<?xml version="1.0" encoding="UTF-8"?>
<suite name="Suite" parallel="false">
<test name="Test">
<parameter name="config" value="webdriver.chrome.driver" />
<classes>
<class name="com.orangehrmlive.DataDrivenTesting"/>
</classes>
</test> <!-- Test -->
</suite> <!-- Suite -->
---------------------------------------------
DataDrivenTesting class code :
ChromeDriver chrome;
@DataProvider(name="dp")
public Object storeData()
{return new Object[][]
{
{"Admin12","admin123"},
{"Admin","admin123"}
};
}
@Parameters({"config"})
@BeforeTest
public void openBrowser(String key) {
System.setProperty(key, "D:\\Software Testing\\Selenium\\chromedriver.exe");
//open the browser
chrome = new ChromeDriver();
chrome.get("https://opensource-demo.orangehrmlive.com/");
}
@Test(priority = 2 , dataProvider="dp")
public void loginTest(String un,String pwd)
{
chrome.findElement(By.id("txtUsername")).sendKeys(un);
chrome.findElement(By.id("txtPassword")).sendKeys(pwd);
chrome.findElement(By.id("btnLogin")).click();
}@AfterTest
public void closeBrowser()
{
chrome.close();
}
}
