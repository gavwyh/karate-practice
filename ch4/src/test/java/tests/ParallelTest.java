package tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import com.intuit.karate.Results;
import com.intuit.karate.junit5.Karate.Test;
import com.intuit.karate.Runner;

public class ParallelTest {
    @Test
    void testProd() {
        Results results = Runner.path("classpath:tests")
                                .karateEnv("prod").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Test
    void testAll() {
        Results results = Runner.path("classpath:tests").parallel(3);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Test
    void testFeature1() {
        Results results = Runner.path("classpath:tests/Test1.feature").parallel(3);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}