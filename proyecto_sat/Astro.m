%objeto satelite  
        function obj = Astro(nombre, masa,radio)
          obj.nombre= nombre;
          obj.masa= masa;   
          obj.radio=radio;
          G=6.67E-11
          obj.mu=G*masa
        end
