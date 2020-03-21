package org.springframework.samples.petclinic.system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.logging.Logger;

@Component
@Profile("cds") // used to generate the list of classes for CDS
public class CDSOnStartServer implements ApplicationListener<ApplicationReadyEvent> {


    private Logger log = Logger.getLogger(CDSOnStartServer.class.getName());

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        executor.execute(() -> {
            log.info("application ready, shutting down to finish the class list generation");
            SpringApplication.exit(event.getApplicationContext());
            executor.shutdown();
        });
    }
}
