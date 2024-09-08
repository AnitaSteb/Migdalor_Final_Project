import axios from "axios";

const BASE_URL = 'https://proj.ruppin.ac.il/bgroup32/test2/tar2/'

export const GetAllObituaries = async () => {
    const {data} = await axios.get(BASE_URL+ 'api/Obituary/GetAllObituaries')
    return data;
}