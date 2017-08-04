/* Make sure the downloaded jar file is in the classpath or has been added to 
   referenced libraries if you are using an SDK like eclipse or netbeans*/
import org.json.*;
import java.util.HashMap;

public class SMS
{
    public static void main(String[] args_)
    {
			// Specify your login credentials
			String username = "jkuat";
			String apiKey   = "30e34507d42910e827b2ed32c6ffe53019f42feacf1a7e905c753196dd4454bd";

            String recipients = "+254708415904,+254729698969,+254702663386,+254726304245,+254723681738,+254707305133";

			String message = "We are lumberjacks. We code all day and sleep all night";

			AfricasTalkingGateway gateway  = new AfricasTalkingGateway(username, apiKey);

	    try {
	        JSONArray results = gateway.sendMessage(recipients, message);
			
	        for( int i = 0; i < results.length(); ++i ) {
		          JSONObject result = results.getJSONObject(i);
		          System.out.print(result.getString("status") + ","); // status is either "Success" or "error message"
		          System.out.print(result.getString("number") + ",");
		          System.out.print(result.getString("messageId") + ",");
		          System.out.println(result.getString("cost"));
	        }
   	    }
   	
        catch (Exception e) {
            System.out.println("Encountered an error while sending " + e.getMessage());
            }
        
    }
}

