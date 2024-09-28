package petStore;

import com.intuit.karate.junit5.Karate;

public class PetStoreRunner {
    @Karate.Test
    Karate testSample() {
        return Karate.run().relativeTo(getClass());
    }
}
