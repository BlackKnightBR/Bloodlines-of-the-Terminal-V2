# Bloodlines of the Terminal — Detailed Project Structure

## 1. Project Name  
**Bloodlines of the Terminal**  
*An epic text-based terminal RPG where choices and battles shape your destiny.*

---

## 2. Core Classes and Responsibilities

### 2.1 Superclass: `Human`  
- **Purpose:** Serve as a base class for all humanoid characters.  
- **Attributes:**  
  - `name` (String): Character’s name  
  - `hp` (Integer): Health points  
  - `attack` (Integer): Base attack strength  
  - `defense` (Integer): Defensive power  
- **Methods:**  
  - `attack(target)`: Perform an attack on another character  
  - `take_damage(amount)`: Reduce hp by damage amount  
  - `alive?`: Check if the character is still alive  
  - `apply_damage(target, base_damage)`: Calculate and apply damage (protected)  

---

### 2.2 Subclasses: `Warrior` and `Mage`  
- **`Warrior`**  
  - Inherits from `Human`  
  - Additional attributes:  
    - `strength` (Integer): Adds extra physical power  
    - `rage` (Integer): Builds up to trigger powerful attacks  
  - Overrides `attack` method:  
    - Performs regular attack adding strength  
    - When rage > 40, does a double damage attack and resets rage  

- **`Mage`**  
  - Inherits from `Human`  
  - Additional attributes:  
    - `intelligence` (Integer): Adds magical power  
    - `charm` (Integer): Builds up to trigger powerful magical attacks  
  - Overrides `attack` method:  
    - Uses intelligence and charm to modify damage  
    - Charm > 50 triggers stronger attack, then resets charm  

---

## 3. Hierarchy and Reusability  

- `Warrior` and `Mage` inherit shared attributes and behaviors from `Human`  
- **Modules/Mixins:**  
  - Future extension to add shared abilities or behaviors without modifying inheritance  
  - Examples: `Flyable`, `Healable`, `Stealthy` modules  

---

## 4. Expected Terminal Interactions  

- **Game Loop:**  
  - Display character status (HP, rage/charm, etc.)  
  - Present action menu (e.g., Attack, Defend, Rest, Use Item)  
  - Read player input, execute chosen action  
  - Display results (damage done, status changes)  
  - Check for end conditions (enemy defeated, player dead)  
- **Battle Flow:**  
  - Turn-based attacks alternating between player and enemy  
  - Player choices influence battle outcome  
- **Narrative:**  
  - Descriptive text to immerse player in world  
  - Decisions can alter future choices and story progression  

---

## 5. Ruby Concepts to Apply  

- **OOP:** Classes, inheritance, encapsulation of character logic  
- **Modules/Mixins:** For reusable shared behaviors  
- **Blocks, Procs, Lambdas:** For customizable actions, callbacks, or event hooks  
- **Keyword Arguments:** For clear method signatures and defaults  
- **Input/Output:** Terminal interaction with `gets.chomp` and `puts`  
- **Error Handling:** Robustness for unexpected inputs  
