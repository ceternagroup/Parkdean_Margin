<aura:application controller="ProductCatalogue" implements="lightning:isUrlAddressable,force:appHostable" extends="force:slds" access="global">
    
  <aura:attribute name="selectedProduct" type="Map"></aura:attribute>
  <aura:attribute name="quoteId" type="String" default="0Q01j0000009Orf"></aura:attribute>
  <aura:attribute name="quote" type="Map"></aura:attribute>
  <aura:attribute name="overideAmount" type="Decimal" default="null"></aura:attribute>
  <aura:attribute name="loaded" type="Boolean" default="false"></aura:attribute>
    
  <aura:handler name="ProductSelection" event="c:ProductSelection" action="{!c.handleSelection}"/>
  <aura:handler name="init" value="{!this}" action="{!c.loadQuote}"></aura:handler>
    
  <aura:if isTrue="{!!v.loaded}">
    <lightning:spinner alternativeText="Loading" /> 
  </aura:if>
    
  <div class="app-header">
    <div class="app-header--quote">{!v.quote.Name} {!v.quoteId}</div>
    <div class="app-header--park">{!v.quote.Park_Name__c}</div>
    <lightning:button variant="brand" label="Back to Quote" onclick="{!c.goBack}"></lightning:button>
  </div>
    
  <div class="app-lhs">
    <div class="slds-card">
      <aura:if isTrue="{!v.loaded}">
        <c:ProductCatalogue quoteId="{!v.quoteId}" parkId="{!v.quote.Park__c}"/>
      </aura:if>
    </div>  
  </div>
  
  <div class="app-rhs">
    <div class="slds-card">
	  <aura:if isTrue="{!v.loaded}">
        <c:AffordabilityCalculator quoteId="{!v.quoteId}" selectedProduct="{!v.selectedProduct}" overideAmount="{!v.overideAmount}"/>
      </aura:if>
    </div>  
  </div>
    
</aura:application>