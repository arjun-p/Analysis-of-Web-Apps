import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class DefaultSearch {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://localhost:8080";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testDefaultSearch() throws Exception {
    driver.get(baseUrl + "/bookstore-orig/Login.jsp");
    driver.findElement(By.xpath("//td[2]/a/font/img")).click();
    driver.findElement(By.xpath("//table[2]/tbody/tr[3]/td/a/font")).click();
    driver.findElement(By.xpath("//td[2]/a/font/img")).click();
    driver.findElement(By.xpath("//td[3]/table/tbody/tr[3]/td/a/font")).click();
    driver.findElement(By.name("Login")).clear();
    driver.findElement(By.name("Login")).sendKeys("guest");
    driver.findElement(By.name("Password")).clear();
    driver.findElement(By.name("Password")).sendKeys("guest");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    driver.findElement(By.xpath("//td[4]/a/font/img")).click();
    driver.findElement(By.xpath("//td[5]/a/font/img")).click();
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
