select w.id
from Weather w
where w.temperature > (select temperature 
                        from Weather
                        where recordDate = w.recordDate -1);