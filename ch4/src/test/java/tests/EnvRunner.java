package tests;

import com.intuit.karate.junit5.Karate;

public class EnvRunner {
    @Karate.Test
    Karate dev() {
        // Runs scenario with dev environment
        return Karate.run("env-demo").karateEnv("dev").relativeTo(getClass());
    }

    @Karate.Test
    Karate prod() {
        return Karate.run("env-demo").karateEnv("prod").relativeTo(getClass());
    }
}