package com.webtesting.crawler;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import com.crawljax.browser.EmbeddedBrowser.BrowserType;
import com.crawljax.core.CrawljaxRunner;
import com.crawljax.core.configuration.BrowserConfiguration;
import com.crawljax.core.configuration.CrawljaxConfiguration;
import com.crawljax.core.configuration.CrawljaxConfiguration.CrawljaxConfigurationBuilder;
import com.crawljax.core.configuration.Form;
import com.crawljax.core.configuration.InputSpecification;
import com.crawljax.plugins.crawloverview.CrawlOverview;


public final class EmpldirCrawler {
private static final long WAIT_TIME_AFTER_EVENT = 200;
private static final long WAIT_TIME_AFTER_RELOAD = 20;
private static String URL = "http://localhost:8080/empldir/Login.jsp";

/**
* Run this method to start the crawl.
*
* @throws IOException
* when the output folder cannot be created or emptied.
*/
public static void main(String[] args) throws IOException {
	//URL = args[0];
CrawljaxConfigurationBuilder builder = CrawljaxConfiguration.builderFor(URL);
builder.crawlRules().insertRandomDataInInputForms(false);
// click these elements
builder.crawlRules().clickDefaultElements();
builder.crawlRules().click("div");
builder.crawlRules().click("a");
builder.crawlRules().click("input").withAttribute("type", "submit");
builder.setMaximumStates(30);
builder.setMaximumDepth(10);
builder.crawlRules().clickElementsInRandomOrder(true);
// Set timeouts
builder.crawlRules().waitAfterReloadUrl(WAIT_TIME_AFTER_RELOAD, TimeUnit.MILLISECONDS);
builder.crawlRules().waitAfterEvent(WAIT_TIME_AFTER_EVENT, TimeUnit.MILLISECONDS);
builder.crawlRules().setInputSpec(getInputSpecification());
// We want to use two browsers simultaneously.
builder.setBrowserConfig(new BrowserConfiguration(BrowserType.FIREFOX, 1));

builder.addPlugin(new CrawlOverview());
try {
	CrawljaxRunner crawljax = new CrawljaxRunner(builder.build());
	crawljax.call();
} catch (Exception e) {
	System.out.println(e.getStackTrace());
}

}
private static InputSpecification getInputSpecification() {
InputSpecification input = new InputSpecification();
Form loginForm = new Form();
loginForm.field("Login").setValues("admin");
loginForm.field("Password").setValues("admin");

Form searchForm = new Form();
searchForm.field("name").setValues("John", "Bob", "Li");
searchForm.field("email").setValues("johns", "", "");
searchForm.field("dep_id").setValues("1","2","Administration");

Form insertEmpsForm = new Form();
insertEmpsForm.field("title").setValues("Ramkumar", "Soumili", "Ali", "Arjun", "Shree");
insertEmpsForm.field("emp_login").setValues("Ramkumar", "Soumili", "Ali", "Arjun", "Shree");
insertEmpsForm.field("emp_password").setValues("Ramkumar", "Soumili", "Ali", "Arjun", "Shree");
insertEmpsForm.field("work_phone").setValues("1","2","9");

input.setValuesInForm(loginForm).beforeClickElement("submit").withText("Login");
input.setValuesInForm(searchForm).beforeClickElement("submit").withText("Search");
input.setValuesInForm(insertEmpsForm).beforeClickElement("submit").withText("Update");
return input;
}


}