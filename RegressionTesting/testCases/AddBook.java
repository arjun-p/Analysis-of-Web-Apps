import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class AddBook {
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
  public void testAddBook() throws Exception {
    driver.get(baseUrl + "/bookstore-orig/Login.jsp");
    driver.findElement(By.name("Login")).clear();
    driver.findElement(By.name("Login")).sendKeys("admin");
    driver.findElement(By.name("Password")).clear();
    driver.findElement(By.name("Password")).sendKeys("admin");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    driver.findElement(By.xpath("//tr[2]/td[2]/a/font")).click();
    driver.findElement(By.name("phone")).clear();
    driver.findElement(By.name("phone")).sendKeys("2138222723");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    driver.findElement(By.xpath("//tr[2]/td[2]/a/font")).click();
    driver.findElement(By.name("phone")).clear();
    driver.findElement(By.name("phone")).sendKeys("");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    driver.findElement(By.xpath("//td[6]/a/font/img")).click();
    driver.findElement(By.xpath("//tr[4]/td/a/font")).click();
    driver.findElement(By.xpath("//tr[3]/td/a/font")).click();
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    driver.findElement(By.xpath("//tr[3]/td/a/font")).click();
    driver.findElement(By.xpath("//input[@value='Cancel']")).click();
    driver.findElement(By.xpath("//tr[2]/td[2]/a/font")).click();
    driver.findElement(By.xpath("//tr[2]/td[3]/a/font")).click();
    driver.findElement(By.xpath("//tr[2]/td[4]/a/font")).click();
    driver.findElement(By.xpath("//tr[2]/td[5]/a/font")).click();
    driver.findElement(By.xpath("//tr[2]/td[6]/a/font")).click();
    driver.findElement(By.xpath("//a[3]/font")).click();
    driver.findElement(By.xpath("//a[2]/font")).click();
    driver.findElement(By.cssSelector("font > a > font")).click();
    driver.findElement(By.name("name")).clear();
    driver.findElement(By.name("name")).sendKeys("test");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    driver.findElement(By.name("price")).clear();
    driver.findElement(By.name("price")).sendKeys("55");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    driver.findElement(By.xpath("//a[3]/font")).click();
    driver.findElement(By.xpath("//tr[5]/td/a/font")).click();
    driver.findElement(By.xpath("//input[@value='Delete']")).click();
    assertTrue(closeAlertAndGetItsText().matches("^Delete record[\\s\\S]$"));
    new Select(driver.findElement(By.name("is_recommended"))).selectByVisibleText("Yes");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    new Select(driver.findElement(By.name("category_id"))).selectByVisibleText("Databases");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
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
