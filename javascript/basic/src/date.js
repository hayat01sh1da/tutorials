"use strict;"

const getDate = (val) => {
  const time = new Date(val);
  return time;
};

const formatEnglishDate = (date) => {
  const year  = String(date.getFullYear());
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day   = String(date.getDate()).padStart(2, "0");
  let enMonth = "";
  switch (month) {
    case "01":
      enMonth = "Jan";
      break;
    case "02":
      enMonth = "Feb";
      break;
    case "03":
      enMonth = "Mar";
      break;
    case "04":
      enMonth = "Apr";
      break;
    case "05":
      enMonth = "May";
      break;
    case "06":
      enMonth = "Jun";
      break;
    case "07":
      enMonth = "Jul";
      break;
    case "08":
      enMonth = "Aug";
      break;
    case "09":
      enMonth = "Sep";
      break;
    case "10":
      enMonth = "Oct";
      break;
    case "11":
      enMonth = "Nov";
      break;
    case "12":
      enMonth = "Dec";
      break;
    default:
      enMonth = "Unknown";
  };
  const enDate = `${day} ${enMonth} ${year}`;
  return enDate;
};

const getHourInUTC = (date) => {
  const timezoneOffsetInHours = date.getTimezoneOffset() / 60;
  const hourInUTC = `Hours in UTC: ${date.getHours() + timezoneOffsetInHours}`
  return hourInUTC
};

export {
  getDate,
  formatEnglishDate,
  getHourInUTC
};
