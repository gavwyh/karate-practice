package tests;

import com.intuit.karate.junit5.Karate;

public class Runner {
    
    @Karate.Test
    Karate test1() {
        return Karate.run("test1").relativeTo(getClass());
    }

    @Karate.Test
    Karate test2() {
        return Karate.run("test2").relativeTo(getClass());
    }

    @Karate.Test
    Karate testAll() {
        return Karate.run("test1", "test2").relativeTo(getClass());
    }
}
