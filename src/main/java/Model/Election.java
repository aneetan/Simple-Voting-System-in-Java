package Model;

public class Election {

    private int EId;
    private String imageFileName;
    private String electionName;
    private String candidacy;
    private String electionDate;

    public int getEId() {
        return EId;
    }

    public void setEId(int EId) {
        this.EId = EId;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }

    public String getElectionName() {
        return electionName;
    }

    public void setElectionName(String electionName) {
        this.electionName = electionName;
    }

    public String getCandidacy() {
        return candidacy;
    }

    public void setCandidacy(String candidacy) {
        this.candidacy = candidacy;
    }

    public String getElectionDate() {
        return electionDate;
    }

    public void setElectionDate(String electionDate) {
        this.electionDate = electionDate;
    }
}
