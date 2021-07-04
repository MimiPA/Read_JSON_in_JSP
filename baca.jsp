<%@ page import="java.io.FileReader" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Maskapai JSON</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#maskapai').DataTable();
        });
    </script>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">
    <!--Tabel List Maskapai-->
    <h1 class="text-center" style="padding-top: 20px;"><i class='fas fa-plane' style='font-size:24px'></i> Jadwal Penerbangan <i class='fas fa-plane' style='font-size:24px'></i></h1>
    <div class="container" style="padding-top: 30px;">
        <table class="table table-bordered table-hover" id="maskapai">
            <thead class="bg-info">
                <tr>
                    <th>ID</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Depart</th>
                    <th>Arrive</th>
                    <th>Price</th>
                    <th>Maskapai</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        String[] aFile = {"jsonRS.json", "jsonCH.json", "jsonMS.json"};
                        String[] aMaskapai = {"Maskapai RS", "Maskapai CH", "Maskapai MS"};
                        int m = 1;

                        for (int z = 0; z < aFile.length; z++) {
                            FileReader fileReader = new FileReader("C:\\xampp\\tomcat\\webapps\\ROOT\\JSON\\" + aFile[z]);
                            JSONParser parser = new JSONParser();
                            JSONObject json = (JSONObject) parser.parse(fileReader);
    
                            JSONArray characters = (JSONArray) json.get("flight");
                            Iterator i = characters.iterator();
                        
                            while (i.hasNext()) {
                                JSONObject json1 = (JSONObject) i.next();

                                String ID = (String) json1.get("ID");
                                String dari = (String) json1.get("dari");
                                String ke = (String) json1.get("ke");
                                String depart = (String) json1.get("depart");
                                String arrive = (String) json1.get("arrive");
                                String price = (String) json1.get("price");        
                %>
                                <tr>
                                    <td><%=m%></td>
                                    <td><%=dari%></td>
                                    <td><%=ke%></td>
                                    <td><%=depart%></td>
                                    <td><%=arrive%></td>
                                    <td><%=price%></td>
                                    <td><%=aMaskapai[z]%></td>
                                </tr>
                <%
                                m++;
                            }
                        }
                    } catch (Exception ex) { 
                        ex.printStackTrace();
                        out.println("ERROR " + ex);
                    }
                %>
            </tbody>
        </table>
    </div>
    <!--End of List Mhs-->
    <hr>

</body>

</html>