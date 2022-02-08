package uz.pdp.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

//Asliddin Kenjaev 2/4/2022 11:17 AM
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Task {
    private int id;
    private int userId;
    private String title;
    private String description;
    private boolean status;
    private LocalDateTime deadline;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public String getDeadline(){
        return deadline.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    public String getCreatedAt() {
        return createdAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd, HH:mm"));
    }

    public String getUpdatedAt() {
        return updatedAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd, HH:mm"));
    }
}
