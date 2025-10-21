
const timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;
document.cookie = `time_zone=${timeZone}; path=/;`;

export default timeZone;
