

export function addHours(date,h) {
    date.setTime(date.getTime() + (h*60*60*1000));
    return date;
}
export  function addMins(date,min) {
    date.setTime(date.getTime() + (min*60*1000));
    return date;
}

export function addSec(date,min){
    date.setTime(date.getTime() + (min*1000));
    return date;
}