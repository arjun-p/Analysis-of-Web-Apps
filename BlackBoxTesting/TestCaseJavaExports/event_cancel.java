import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class event_cancel {
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
  public void testEventCancel() throws Exception {
    driver.get(baseUrl + "/events/Default.jsp");
    driver.findElement(By.xpath("//td[3]/a/font/img")).click();
    driver.findElement(By.name("name")).clear();
    driver.findElement(By.name("name")).sendKeys("Hello");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    assertTrue(isElementPresent(By.cssSelector("td > font")));
    driver.findElement(By.name("location")).clear();
    driver.findElement(By.name("location")).sendKeys("LA");
    driver.findElement(By.name("name")).clear();
    driver.findElement(By.name("name")).sendKeys("");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    assertTrue(isElementPresent(By.cssSelector("td > font")));
    driver.findElement(By.name("location")).clear();
    driver.findElement(By.name("location")).sendKeys("");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    assertTrue(isElementPresent(By.cssSelector("td > font")));
    driver.findElement(By.xpath("//input[@value='Cancel']")).click();
    driver.findElement(By.name("name")).clear();
    driver.findElement(By.name("name")).sendKeys("Hello");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    assertTrue(isElementPresent(By.xpath("//table[3]/tbody/tr/td/table/tbody/tr[2]/td/font")));
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
