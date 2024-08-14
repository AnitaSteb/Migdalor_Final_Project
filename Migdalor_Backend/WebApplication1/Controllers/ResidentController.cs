﻿using ClassLibrary1.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using WebApplication1.DTO;

namespace WebApplication1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ResidentController : ControllerBase
    {
        MigdalorContext db = new MigdalorContext();

        
        [HttpPost]
        [Route("AddResident")]
        public IActionResult AddResident([FromBody] ResidentDTO userInput)
        {
            try
            {
                if (userInput == null)
                {
                    return BadRequest("User input is null");
                }

                // Check if the username already exists
                if (db.TblResidents.Any(u => u.Username == userInput.Username))
                {
                    return BadRequest("Username already exists");
                }

                int randomResidentNumber = new Random().Next(0, 2147483647);

                var resident = new TblResident
                {
                    ResidentNumber = randomResidentNumber,
                    Username = userInput.Username,
                    Password = userInput.Password,
                    FirstName = userInput.FirstName,
                    LastName = userInput.LastName,
                    PhoneNumber = userInput.PhoneNumber,
                    Id = userInput.Id,
                    DateOfBirth = userInput.DateOfBirth,
                    PreviousAddress = userInput.PreviousAddress,
                    ResidentImage = userInput.ResidentImage,
                    Profession = userInput.Profession,
                    Email = userInput.Email
                };

                db.TblResidents.Add(resident);
                db.SaveChanges();

                return Ok("User added successfully");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }



        [HttpGet]
        public ActionResult<IEnumerable<TblResident>> GetResidents()
        {
            var residents = db.TblResidents.ToList();
            return Ok(residents);
        }


        [HttpPut]
        [Route("UpdateResident")]
        public IActionResult UpdateResident([FromBody] ResidentUpdateDTO updateDto)
        {
            try
            {
                // Extract residentNumber from JWT token
                var identity = HttpContext.User.Identity as ClaimsIdentity;
                if (identity == null)
                {
                    return Unauthorized("Invalid token");
                }
                // Use the appropriate claim type to get the residentNumber
                var residentNumberClaim = identity.FindFirst("http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name");

                if (residentNumberClaim == null)
                {
                    return Unauthorized("residentNumber not found in token");
                }

                int residentNumber;
                if (!int.TryParse(residentNumberClaim.Value, out residentNumber))
                {
                    return BadRequest("Invalid residentNumber in token");
                }
                //int residentNumber = int.Parse(identity.FindFirst(ClaimTypes.NameIdentifier)?.Value);

                // Fetch the resident from the database
                var resident = db.TblResidents.FirstOrDefault(r => r.ResidentNumber == residentNumber);
                if (resident == null)
                {
                    return NotFound("Resident not found");
                }

                // Update only the fields that are allowed to be updated
                if (updateDto.FirstName != null) resident.FirstName = updateDto.FirstName;
                if (updateDto.LastName != null) resident.LastName = updateDto.LastName;
                if (updateDto.PhoneNumber != null) resident.PhoneNumber = updateDto.PhoneNumber;
                if (updateDto.CurrentAddress != null) resident.CurrentAddress = updateDto.CurrentAddress;
                //if (updateDto.ResidentImage != null) resident.ResidentImage = updateDto.ResidentImage;
                if (updateDto.Profession != null) resident.Profession = updateDto.Profession;
                if (updateDto.Email != null) resident.Email = updateDto.Email;
                if (updateDto.AboutMe != null) resident.AboutMe = updateDto.AboutMe;
                if (updateDto.Username != null) resident.Username = updateDto.Username;
                if (updateDto.Password != null) resident.Password = updateDto.Password;

                db.SaveChanges();

                return Ok(resident);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }


    }
}
