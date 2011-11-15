#Author: Edgar Perez
#Function that returns the letters needed to write, in spanish, up to any given number you specify through a command line argument

def get_letters_upto number
	return if !number.integer? || number < 0 || number > 1000 #limit the input to 0-1000, altough teoretically the code still works for numbers >1000
	
	#Names of numbers in spanish, divided in units, tens, hundreds and thousands. Numbers between 11-19 are special cases
	units_string = ['cero','uno','dos','tres','cuatro','cinco','seis','siete','ocho','nueve']
	over_ten_string = ['','once','doce','trece','catorce','quince','dieciseis','diecisiete','dieciocho','diecinueve']
	tens_string = ['','diez','veinte','treinta','cuarenta','cincuenta','sesenta','setenta','ochenta','noventa']
	hundreds_string = ['','ciento','doscientos','trescientos','cuatrocientos','quinientos','seiscientos','setecientos','ochocientos','novecientos']
	thousands_string = ['','mil']
	
	#Add number names to the array result, using only the elements from zero to N number of units, tens, hundreds and thousands.
	#For example, number 543 will require all units, all tens, all special cases (11-19) and hundreds from 1 to 5
	all_numbers = []
	all_numbers += units_string[0..number]
	all_numbers += over_ten_string[1..number-10] if number >= 10 #only include the special cases we need, if the number over 10.
	all_numbers += tens_string[1..number/10]
	all_numbers += ['y'] if number > 30 #31 and above you write numbers as 'treinta y'
	all_numbers += hundreds_string[1..number/100]
	all_numbers += thousands_string[1..number/1000]
	all_numbers.join.chars.to_a.uniq.sort #once we have every number we need in string form, join all strings, keep unique letters only and sort them
end

#Process input and print the character array
p get_letters_upto ARGV[0].to_i