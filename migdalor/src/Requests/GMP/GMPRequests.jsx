import axios from "axios";

const BASE_URL = `https://proj.ruppin.ac.il/bgroup32/test2/tar2/api/GMPolicy/`

export const GetReportedResidents = async () =>{
    const {data} = await axios.get(BASE_URL + 'ReportedResidents')
    return data;
}
export const GetNotReportedResidents = async () =>{
    const {data} = await axios.get(BASE_URL + 'ResidentsNotReported')
    return data;
}
