package Tests;

import com.intuit.karate.junit5.Karate;

public class SampleTest {
	
    @Karate.Test
    Karate testSample() {
        return Karate.run("sample1").relativeTo(getClass());
    }
    
    @Karate.Test
    Karate testTags() {
        return Karate.run("sample1").tags("@Second").relativeTo(getClass());
    }
}
