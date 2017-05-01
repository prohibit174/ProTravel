<!DOCTYPE html>
<html>
  <head>
  
<link rel='stylesheet' href='fullcalendar.css' />

  <script src='lib/jquery.min.js'></script>
<script src='lib/moment.min.js'></script>
<!-- <script src='jquery-ui.js'></script>
<script src='jquery-ui.min.js'></script> -->
<script src='fullcalendar.js'></script>

    <style>
       #map {
        height: 400px;
        width: 45%;
       }
       #calendar {
        height:600px;
        width: 45%;
       }
    </style>
  </head>
  
  <body>
    <div id="map"></div>
    <div id='calendar'></div>
    
    <script>
    /* Map 관련 변수 */
      var markerPosition;   
       var marker_zoom4=[];
       var marker_zoom5=[];
       latLngList = [];
       susDay = null;
       susEnd = null;
       
        function LongDateToShortDate(longDate){
            var todayYear= longDate.getFullYear();
            var todayMonth= longDate.getMonth()+1;
            //longDate.setDate(longDate.getDate()+1);
               var todayday= longDate.getDate();
               if(todayMonth<10)
               {
                  todayMonth='0'+todayMonth;   
               }
               if(todayday<10)
            {
               todayday='0'+todayday;   
            }
         
               longDate=String(todayYear+'-'+todayMonth+'-'+todayday);
               shortDate=longDate;
               return shortDate;
         }
         
          function ShortDateToLongDate(shortDate){
            tempDate=new Date();
            var temp=String(shortDate);
            var strArr=temp.split('-');
            tempDate.setFullYear(strArr[0]);
            tempDate.setMonth(strArr[1]-1);
            tempDate.setDate(strArr[2]);

            var LongDate=tempDate;
            return LongDate;
         } 
          
       
     /* Calendar 관련 변수 */  
      var todayDate = new Date(); //현재 날짜
      var currentDate=new Date();      
      
      var calEventColor=[];
      calEventColor=["#CEFFC7","#FFFF5A","#D7FF6C","#FFD6FD","#B5B2FF", "#B6FFFF", "FFEDA2", "notReachable"];
      var indexOfCalEventColor=0;
      function nextEventColor(){
    	  if(indexOfCalEventColor==calEventColor.length-1)
    		  indexOfCalEventColor=0;
    	  return calEventColor[indexOfCalEventColor++]; 
      }
      
      
      function initMap() {
       // when zoom is 4, present location of france, belgium, germany, swiss.
        var franceLocation = {lat: 48.856667, lng: 2.350833};
        var belgiumLocation = {lat: 50.85, lng: 4.35};
        var germanyLocation = {lat: 52.500556, lng: 13.398889};
        var swissLocation = {lat: 46.95, lng: 7.45};
        
        // when zoom is 5, present marker of location of below cities.
        var parisLocation = {lat: 48.856667, lng: 2.350833};
        var niceLocation = {lat: 43.703333, lng: 7.266389};
        var brusselsLocation = {lat: 50.85, lng: 4.35};
        var berlinLocation = {lat: 52.518611, lng: 13.408056};
        var munichLocation = {lat: 48.133333, lng: 11.566667};
        var bernLocation = {lat: 46.95, lng: 7.45};
        var zurichLocation = {lat: 47.366667, lng: 8.55};
        
      
       
         marker_zoom4[0] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: franceLocation,
            map: map,
            title:'France'
          });
       marker_zoom4[1] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: belgiumLocation,
            map: map,
            title:'Belguim'
          });
       marker_zoom4[2] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: germanyLocation,
            map: map,
            title:'Germany'
          });
       marker_zoom4[3] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: swissLocation,
            map: map,
            title:'Swiss'
         });
       
        marker_zoom5[0] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: parisLocation,
            map: map,
            title:'Paris'
          });
       marker_zoom5[1] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: niceLocation,
            map: map,
            title:'Nice'
          });
       marker_zoom5[2] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: brusselsLocation,
            map: map,
            title:'Brussels'
          });
       marker_zoom5[3] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: berlinLocation,
            map: map,
            title:'Berlin'
          });
       marker_zoom5[4] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: munichLocation,
            map: map,
            title:'Munich'
          });
       marker_zoom5[5] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: bernLocation,
            map: map,
            title:'Bern'
          });
       marker_zoom5[6] = new google.maps.Marker({//Ã«Â§Â Ã¬Â»Â¤Ã«Â¥Â¼ uluruÃ¬Â Â  Ã¬Â°Â Ã¬Â Â 
            position: zurichLocation,
            map: map,
            title:'Zurich'
          });
      
 
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: parisLocation
        });
        
                     //marker_zoom4[i].setAnimation(google.maps.Animation.BOUNCE);

             window.setTimeout(function(){
                marker_zoom4[0].setAnimation(google.maps.Animation.DROP);
                //marker_zoom4[0].setAnimation(google.maps.Animation.BOUNCE);
                 marker_zoom4[0].setMap(map);
            },200);
             window.setTimeout(function(){
                 marker_zoom4[1].setAnimation(google.maps.Animation.DROP);
                // marker_zoom4[1].setAnimation(google.maps.Animation.BOUNCE);
                  marker_zoom4[1].setMap(map);
             },400);
             window.setTimeout(function(){
                 marker_zoom4[2].setAnimation(google.maps.Animation.DROP);
                // marker_zoom4[2].setAnimation(google.maps.Animation.BOUNCE);
                  marker_zoom4[2].setMap(map);
             },600);
             window.setTimeout(function(){
                 marker_zoom4[3].setAnimation(google.maps.Animation.DROP);
                // marker_zoom4[3].setAnimation(google.maps.Animation.BOUNCE);
                  marker_zoom4[3].setMap(map);
             },800);
             
             
            

        map.addListener('zoom_changed', function() {
            if(map.getZoom()<5){

               if(marker_zoom5[0]!=null){
                  for(i=0; i<7; i++){
                      marker_zoom5[i].setMap(null);
                   } 
               }
               for(i=0; i<4; i++){
               marker_zoom4[i].setMap(map);
               }
             }
            else if(map.getZoom()>=5){
               
            for(i=0; i<4; i++){
                  marker_zoom4[i].setMap(null);
               }   
              for(i=0; i<7; i++){
                  marker_zoom5[i].setMap(map);
               }
            }
          });
        
        /* marker_zoom4 클릭 이벤트*/
        for(i=0;i<marker_zoom4.length;i++)
       {
          marker_zoom4[i].addListener('click', function() {
             if(susDay == null || susEnd == null){
                  if(susDay == null ){
                alert("select start date")
                }
                  else{
                alert("select end date")
                }
             }else{
                
           susEnd=LongDateToShortDate(ShortDateToLongDate(susEnd));
           
           latLngList.push(this.getPosition());
            createLine(latLngList, map);
             
             var title=this.getTitle();
             var date=currentDate;
             
           //start, end day style default
             $('.fc-day[data-date="'+susDay+'"]').css('background-color', 'white').text("");
             $('.fc-day[data-date="'+susEnd+'"]').css('background-color', 'white').text("");
             
             
             susDay=susDay+'T00:00:00';
             susEnd=susEnd+'T10:00:00';
             var eventColor=nextEventColor();
             
             
              $('#calendar').fullCalendar( 'addEventSource', {
            	  events: [
                       {
                           title: title,
                           start: susDay,
                           end : susEnd
                       }
                   ],
                   allDay:true,
                   color: eventColor,   
                   textColor: 'black'
               } );
                 susDay = null;
               susEnd = null;
               }      //else end
               });   //click event end
       }
        /* marker_zoom5 클릭 이벤트*/
        for(i=0;i<marker_zoom5.length;i++)
        {
            marker_zoom5[i].addListener('click', function() {
               if(susDay == null || susEnd == null){
                    if(susDay == null ){
                  alert("select start date")
                  }
                    else{
                  alert("select end date")
                  }
               }else{
                  
             susEnd=LongDateToShortDate(ShortDateToLongDate(susEnd));
             
             latLngList.push(this.getPosition());
              createLine(latLngList, map);
               
               var title=this.getTitle();
               var date=currentDate;
               
             //start, end day style default
               $('.fc-day[data-date="'+susDay+'"]').css('background-color', 'white').text("");
               $('.fc-day[data-date="'+susEnd+'"]').css('background-color', 'white').text("");
               
               
               susDay=susDay+'T00:00:00';
               susEnd=susEnd+'T10:00:00';
               var eventColor=nextEventColor();
                $('#calendar').fullCalendar( 'addEventSource', {
                     events: [
                         {
                             title: title,
                             start: susDay,
                             end : susEnd
                         }
                     ],
                     color: eventColor,   // an option!
                     textColor: 'black' // an option!
                     
                 } )
                   susDay = null;
                 susEnd = null;
                 }      //else end
                 });   //click event end
         }
      }  // initmap end
      
      
      //선긋기 
      function createLine(latLngList, map){ 
         var movingPath = new google.maps.Polyline({
          path: latLngList,
          geodesic: true,
          strokeColor: '#000000',
          strokeOpacity: 10.0,
          strokeWeight: 1
        });
         if(latLngList.length>1){
         movingPath.setMap(map);
         }
      }
    //선긋기
    
    
    
    
    
       /* ------------------------initMap() 종료 --------------------------------------------------------*/
      /* ------------------------Calendar 관련 스트립트 시작 ------------------------------------------------*/
      
      
        $(document).ready(function(){
       // page is now ready, initialize the calendar...
       $('#calendar').fullCalendar({
           // put your options and callbacks here
            	defaultDate : todayDate,
              	 events: [
                     {
                         title: 'title',
                         start: '2017-04-27'
                     }
                 ]
            	, editable : true
                , resizable: true
                , eventLimit : true
                , dayClick: function(date, jsEvent, view) {
                   if(susDay == null){
                    susDay = String(date.format())
                    $(this).css('background-color', 'green').text('start');
                    
                   }
                    else if(susEnd == null){
                   susEnd = String(date.format())
                   $(this).css('background-color', 'red').text('end');
                    
                    };
                /*    alert('Clicked on: ' + date.format());
                    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
                    alert('Current view: ' + view.name); */

                    // change the day's background color just for fun
                    /*  $(this).css('background-color', 'green'); */
                },
       });
   });
    
     
      
    
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBnrWQ2SHvedNrvdozheYo32pHwCbuvPgs&callback=initMap">
    </script>

  </body>
</html>