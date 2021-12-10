   function getVerification(bytes32 _verificationId) public view returns (
        bytes32 id,
        string discipline,
        string team,
        uint cycle,
        uint date,
        uint percentage,
        VerificationResult result) {
