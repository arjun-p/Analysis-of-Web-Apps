# Analysis-of-Web-Apps

Technique 1: Black Box Testing Using Selenium
1. Generate test Cases based on Finite State Machine
2. Capture/Replay test cases using Selenium 
3. Verify result of the test cases
4. Measure coverage

Technique 2: White Box Testing Using WAM
1. Generate white box test cases using WAM
2. Configure WAM to obtain details about various methods parameters in each servlet.
3. Use WAM output to create a test suite that achieves high statement coverage.
4. Run test cases.

Technique 3: Usage Based Testing
Goal is to record and replay user interactions
1. Configure Tomcat to record all requests
	a. Use the Access Log Valve 
	b. Generate customizable log files 
2. Replay and check all responses 
	a. Build script to parse log 
	b. Run all requests against the app 
3. Check responses for “correctness”

Technique 4: Web Crawling
1. Create a Maven Project to crawl a web application using Crawjax
2. Detect seeded errors in the application via the crawl
3. Generate test report of the discovered faults
4. Measure coverage using Cobertura

Technique 5: Formal Verification Using Apache BCEL library
1. Use Apache BCEL library to generate Control flow graph for servlets
2. Use the generated control flow graph to reason about ordering of invocations.
3. Verify reachability properties over the graph.

Technique 6: Formal Specification - Behaviour Driven Testing 
In BDD, application behaviours are described in plain text and then we write translators for semi-formal language to actual programming steps. This separates “business logic” from “programming logic”.

1. Create tests based on (semi) formal specification of user behaviour using Cucumber and Capybara 
2. Detect failures in a web application 
3. Measure coverage

Technique 7: Regression Testing
Goal is to perform regression test selection using the DejaVu method 
1. Build control flow graphs of servlets 
2. Track test case coverage of the model 
3. Identify test cases to be rerun given the “changes” 
3. Calculate time “savings” by the implemented technique 

Technique 8: Fault Localization
Goal: Perform fault localization using the Tarantula method 
1. Track statements executed by test cases and the test cases’ pass/fail status 
2. Run test cases on bookstore web app.
3. Identify suspicious statements






