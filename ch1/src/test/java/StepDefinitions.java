import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class StepDefinitions {
    @Given("I am on the Web shop homepage")
    public void goToHomepage() {
        System.out.println("Go to homepage");
    }

    @When("I search for {string}")
    public void search(final String searchTerm) {
        System.out.println("Search for " + searchTerm);
    }
}